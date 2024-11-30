% create the function "runIt" that runs the entire thing here:

% -----------------------------------------------------------------------
% HERE ARE OUR FACTS

% who are male/female
male(me).
male(my_father).
male(bouncing_baby_boy).
male(ne_the_run_kid).
female(pretty_widow).
female(red_hair_grown_daughter_of_widow).

% who are married
% might have to see how we can make this into a rule
% the fact is a biconditional
married(me,pretty_widow).
married(pretty_widow,me).
married(my_father,red_hair_grown_daughter_of_widow).
married(red_hair_grown_daughter_of_widow,my_father).

% child_of(kid, parent1, parent 2)
% there are two parents to make this easier to figure out who are the bio parents and step-parents
child_of(me, my_father, unknown).
child_of(bouncing_baby_boy, pretty_widow, me).
child_of(red_hair_grown_daughter_of_widow, unknown, pretty_widow).
child_of(on_the_run_kid, my_father, red_hair_grown_daughter_of_widow).

% -----------------------------------------------------------------------
% HERE ARE OUR RULES

% a simple not function to help with creating other rules
not(X) :- X, !, fail.
    not(_).

% wife(X,Y) X is wife, Y is husband
% this function shows which characters are wives
wife(X,Y) :- female(X), married(Y,X).

% married(X,Y) dunno know if we need this since we already have the married as a fact

% parent(X,Y) X is parent, Y is child
% this function shows parent relations regardless of blood
parent(X,Y) :-
    child_of(Y,X,_);
    (married(X,Z), child_of(Y,Z,_)).

% parent_in_law(X,Z) X is parent of persons spouse, Z is person in question
parent_in_law(X,Z) :-
    married(Z,Y),
    child_of(Y,X,_).

% step_parent(X,Z) X is parent, Z is child
step_parent(X,Z) :-
    (not(child_of(Z,X,W));
    not(child_of(Z,W,X))),
    married(X,W).

% biological_parent(X,Y) X is parent, Y is child
biological_parent(X,Y) :-
    child_of(Y,X,_);
    child_of(Y,_,X).

% grandparent(X,Y)
% sibling(X,Y)
% sibling_in_law(X,Y)
% uncle_ant(X,Z)
