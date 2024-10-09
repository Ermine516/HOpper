import clingo
import pyswip
from typing import List

def finalize_prolog(prolog, rules):
    for rule in rules:
        prolog.assertz(rule)

def finalize_asp(settings, rules):
    settings.bias_string += "\n".join(rules)

def sub_pred_name(pred_name, arg_num, usage):
    return f'{pred_name}_{chr(ord("p")+arg_num)}_{chr(ord("a")+usage)}'

def call_name(pred_name, usage):
    return f'{pred_name}_{chr(ord("a")+usage)}'

asp = []
pr = []
ho_predicates = set()
print_debug = False

def prolog_rule(rule):
    if print_debug:
        print(f"prl: {rule}")
    pr.append(rule)

def asp_rule(rule):
    if print_debug:
        print(f"asp: {rule}")
    asp.append(rule)

def register_ho_predicate(pred_name):
    ho_predicates.add(pred_name)

def is_ho_predicate(pred_name):
    return pred_name in ho_predicates

def make_higher_order(pred_name : str, usage : int, arity : int, arities : List[int], main_name : str):
    pred = call_name(pred_name, usage)
    vs = ", ".join(f"A{i+1}" for i in range(arity))
    ps = ", ".join(sub_pred_name(pred_name, i, usage) for i in range(len(arities)))
    prolog_rule(f"{pred}({vs}) :- {pred_name}({ps}, {vs})")

    asp_rule(f"body_pred({pred}, {arity}).")
    register_ho_predicate(pred)

    for i, subpred_arity in enumerate(arities):
        sub_name = sub_pred_name(pred_name, i, usage)
        asp_rule(f"head_pred({sub_name}, {subpred_arity}).")
        register_ho_predicate(sub_name)
        asp_rule(f"ho_arg({sub_name}).")

        asp_rule(f"call_edge({pred}, {arity}, {sub_name}, {subpred_arity}).")
#        asp_rule(f"body_pred({sub_name}, {subpred_arity}).")

        asp_rule(f":- body_literal(_, {pred}, {arity}, _), not head_literal(_, {sub_name}, {subpred_arity}, _).")
            # if higher-order used, subpredicates must be defined
        asp_rule(f":- head_literal(_, {sub_name}, {subpred_arity}, _), not call_path({main_name}, _, {sub_name}, {subpred_arity}).")
            # if defined, must be used (there must be a call path)
        asp_rule(f":- body_literal(_, {sub_name}, {subpred_arity}, _), not head_literal(_, {sub_name}, {subpred_arity}, _).")

        asp_rule(f"higher_order_arg({sub_name}, {subpred_arity}).")
            # if subpredicate used, it must be defined

def preprocess_ho(prolog : pyswip.Prolog, settings):
    if not any(True for _ in prolog.query("current_predicate(higher_order_predicate/4)")):
        return

    global print_debug
    print_debug = settings.debug

#    prolog_rule("call_pred(P, Args) :- length(Args, L), sub_predicate_of_arity(P, L), (Goal =.. [P|Args]), call(Goal)")

#    asp_rule(":- not head_literal(0, f, _, _).")

    asp_rule("call_edge(A, AR, B, BR) :- head_literal(C, A, AR, _), body_literal(C, B, BR, _).")
    asp_rule("call_path(A, AR, B, BR) :- call_edge(A, AR, B, BR).")
    asp_rule("call_path(A, AR, B, BR) :- call_edge(A, AR, C, CR), call_path(C, CR, B, BR).")
    
    settings.any_ho = True

    for ho_pred in prolog.query("higher_order_predicate(Pred, HOArities, Arity, Usages)"):
        pred_name = str(ho_pred["Pred"])
        usages = int(ho_pred["Usages"])
        arity = int(ho_pred["Arity"])
        arities = list(ho_pred["HOArities"])
        assert all(isinstance(x, int) for x in arities)
        assert len(arities) > 0

        for usage in range(usages):
            make_higher_order(pred_name, usage, arity, arities, settings.main)

    finalize_prolog(prolog, pr)
    finalize_asp(settings, asp)
