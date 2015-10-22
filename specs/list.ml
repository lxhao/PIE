#use "top_helper.ml"

(* #################### PROPERTIES  #################### *)

(*** List.length ***)

let lengthRes = fun () ->
let name = "length" in
let f = List.length in
let tests = intList_tests () in
let typ = [ TList ] in
let tfun = fun l -> [ of_list of_int l ] in
let def_features = (*PYF:l|L(1)*) in
let my_features = [] in
let def_postconditions = (*PYP:l|L(1)|I*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, intList_dumper) ~record:name f tests features postconds trans
;;



(*** List.hd ***)

let hdRes = fun () ->
let name = "hd" in
let f = List.hd in
let tests = intList_tests () in
let typ = [ TList ] in
let tfun = fun l -> [ of_list of_int l ] in
let def_features = (*PYF:l|L(1)*) in
let my_features = [] in
let def_postconditions = (*PYP:l|L(1)|1*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, intList_dumper) ~record:name f tests features postconds trans
;;



(*** List.nth ***)

let lnth = fun (l,n) -> List.nth l n;;

let nthRes = fun () ->
let name = "nth" in
let f = lnth in
let tests = intList_int_tests () in
let typ = [ TList ; TInt ] in
let tfun = fun (l,n) -> [ of_list of_int l ; of_int n ] in
let def_features = (*PYF:l|T(l:L(1),n:I)*) in
let my_features = [] in
let def_postconditions = (*PYP:l|T(l:L(1),n:I)|1*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, intList_int_dumper) ~record:name f tests features postconds trans
;;



(*** List.mem ***)

let lmem = fun (m,l) -> List.mem m l;;

let memRes = fun () ->
let name = "mem" in
let f = lmem in
let tests = int_intList_tests () in
let typ = [ TInt ; TList ] in
let tfun = fun (m,l) -> [ of_int m ; of_list of_int l ] in
let def_features = (*PYF:l|T(m:1,l:L(1))*) in
let my_features = [] in
let def_postconditions = (*PYP:l|T(m:1,l:L(1))|B*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, int_intList_dumper) ~record:name f tests features postconds trans
;;



(* #################### MUTATORS  #################### *)

(*** List.tl ***)

let tlRes = fun () ->
let name = "tl" in
let f = List.tl in
let tests = intList_tests () in
let typ = [ TList ] in
let tfun = fun l -> [ of_list of_int l ] in
let def_features = (*PYF:l|L(1)*) in
let my_features = [] in
let def_postconditions = (*PYP:l|L(1)|L(1)*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, intList_dumper) ~record:name f tests features postconds trans
;;



(*** List.append ***)

let lappend = fun (l0, l1) -> List.append l0 l1;;

let appendRes = fun () ->
let name = "append" in
let f = lappend in
let tests = intList_intList_tests () in
let typ = [ TList ; TList ] in
let tfun = fun (l0, l1) -> [ of_list of_int l0 ; of_list of_int l1 ] in
let def_features = (*PYF:l|T(l0:L(1),l1:L(1))*) in
let my_features = [] in
let def_postconditions = (*PYP:l|T(l0:L(1),l1:L(1))|L(1)*) in
let my_postconditions = [
    ((fun (l0,l1) r -> match r with Bad _ -> false | Ok lr -> List.length(lr) = List.length(l0) + List.length(l1)), "len(res) = len(l0)+len(l1)");
    ((fun (l0,l1) r -> match r with Bad _ -> false | Ok lr -> List.length(lr) != List.length(l0) + List.length(l1)), "len(res) != len(l0)+len(l1)")
] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, intList_intList_dumper) ~record:name f tests features postconds trans
;;



(*** List.combine ***)

let lcombine = fun (l1,l2) -> List.combine l1 l2;;

let combineRes = fun () ->
let name = "combine" in
let f = lcombine in
let tests = intList_intList_tests () in
let typ = [ TList ; TList ] in
let tfun = fun (l0, l1) -> [ of_list of_int l0 ; of_list of_int l1 ] in
let def_features = (*PYF:l|T(l0:L(1),l1:L(2))*) in
let my_features = [] in
let def_postconditions = (*PYP:l|T(l0:L(1),l1:L(2))|L(T(x0:1,x1:2))*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, intList_intList_dumper) ~record:name f tests features postconds trans
;;



(*** List.concat ***)

let concatRes = fun () ->
let name = "concat" in
let f = List.concat in
let tests = intListList_tests () in
let typ = [ TList ] in
let tfun = fun l -> [ of_list (of_list of_int) l ] in
let def_features = (*PYF:l|L(L(1))*) in
let my_features = [] in
let def_postconditions = (*PYP:l|L(L(1))|L(1)*) in
let my_postconditions = [
    ((fun ls r -> match r with Bad _ -> false | Ok lr -> List.length(lr) > List.fold_left (+) 0 (List.map List.length ls)), "len(res) > sum(len(l0:lN))");
    ((fun ls r -> match r with Bad _ -> false | Ok lr -> List.length(lr) = List.fold_left (+) 0 (List.map List.length ls)), "len(res) = sum(len(l0:lN))");
    ((fun ls r -> match r with Bad _ -> false | Ok lr -> List.length(lr) < List.fold_left (+) 0 (List.map List.length ls)), "len(res) < sum(len(l0:lN))")
] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, intListList_dumper) ~record:name f tests features postconds trans
;;



(*** List.flatten ***)

let flattenRes = fun () ->
let name = "flatten" in
let f = List.flatten in
let tests = intListList_tests () in
let typ = [ TList ] in
let tfun = fun l -> [ of_list (of_list of_int) l ] in
let def_features = (*PYF:l|L(L(1))*) in
let my_features = [] in
let def_postconditions = (*PYP:l|L(L(1))|L(1)*) in
let my_postconditions = [
    ((fun ls r -> match r with Bad _ -> false | Ok lr -> List.length(lr) > List.fold_left (+) 0 (List.map List.length ls)), "len(res) > sum(len(l0:lN))");
    ((fun ls r -> match r with Bad _ -> false | Ok lr -> List.length(lr) = List.fold_left (+) 0 (List.map List.length ls)), "len(res) = sum(len(l0:lN))");
    ((fun ls r -> match r with Bad _ -> false | Ok lr -> List.length(lr) < List.fold_left (+) 0 (List.map List.length ls)), "len(res) < sum(len(l0:lN))")
] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, intListList_dumper) ~record:name f tests features postconds trans
;;



let testConcatFlattenEquivalence = fun () ->
    concatRes() = flattenRes()
;;



(*** List.rev ***)

let revRes = fun () ->
let name = "rev" in
let f = List.rev in
let tests = intList_tests () in
let typ = [ TList ] in
let tfun = fun l -> [ of_list of_int l ] in
let def_features = (*PYF:a|L(1)*) in
let my_features = [] in
let def_postconditions = (*PYP:a|L(1)|L(1)*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, intList_dumper) ~record:name f tests features postconds trans
;;



(*** List.rev_append ***)

let lrev_append = fun (l0, l1) -> List.rev_append l0 l1;;

let rev_appendRes = fun () ->
let name = "rev_append" in
let f = lrev_append in
let tests = intList_intList_tests () in
let typ = [ TList ; TList ] in
let tfun = fun (l0, l1) -> [ of_list of_int l0 ; of_list of_int l1 ] in
let def_features = (*PYF:l|T(l0:L(1),l1:L(1))*) in
let my_features = [] in
let def_postconditions = (*PYP:l|T(l0:L(1),l1:L(1))|L(1)*) in
let my_postconditions = [
    ((fun (l0,l1) r -> match r with Bad _ -> false | Ok lr -> List.length(lr) = List.length(l0) + List.length(l1)), "len(res) = len(l0)+len(l1)");
    ((fun (l0,l1) r -> match r with Bad _ -> false | Ok lr -> List.length(lr) != List.length(l0) + List.length(l1)), "len(res) != len(l0)+len(l1)")
] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, intList_intList_dumper) ~record:name f tests features postconds trans
;;



(*** List.split ***)

let splitRes = fun () ->
let name = "split" in
let f = List.split in
let tests = int_int_List_tests () in
let typ = [] in
let tfun = fun l -> [ ] in
let def_features = (*PYF:l|L(T(x0:1,x1:2))*) in
let my_features = [] in
let def_postconditions = (*PYP:l|L(T(x0:1,x1:2))|T(r0:L(1),r1:L(2))*) in
let my_postconditions = [] in
  let trans = (typ, tfun) in
  let features = def_features @ my_features in
  let postconds = def_postconditions @ my_postconditions in
    resolveAndPacLearnSpec ~dump:(name, int_int_List_dumper) ~record:name f tests features postconds trans
;;
