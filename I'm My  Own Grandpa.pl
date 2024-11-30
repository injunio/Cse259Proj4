% create the function "runIt" that runs the entire thing here:

% -----------------------------------------------------------------------%
%                                                                        %
% HERE ARE OUR FACTS                                                     %
%                                                                        %
% -----------------------------------------------------------------------%

% who are male/female
male(me).
male(my_father).
male(bouncing_baby_boy).
male(ne_the_run_kid).
female(pretty_widow).
female(red_hair_grown_daughter_of_widow).

% who are married
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

% -----------------------------------------------------------------------%
%                                                                        %
% HERE ARE OUR RULES                                                     %
%                                                                        %
% -----------------------------------------------------------------------%

% a simple not function to help with creating other rules
not(X) :- X, !, fail.
    not(_).

% wife(X,Y) X is wife, Y is husband
% this function shows which characters are wives
wife(X,Y) :- female(X), married(Y,X).


% parent(X,Y) X is parent, Y is child
% this function shows parent relations regardless of blood
parent(X,Y) :-
    child_of(Y,X,_);
    step_parent(X,Y).

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

% grandparent(X,Y) X is grandparent, Y is grandchild
grandparent(X,Y) :-
    parent(Z,Y),
    parent(X,Z).

% sibling(X,Y)
% sibling_in_law(X,Y)
% uncle_aunt(X,Z)

% -----------------------------------------------------------------------%
% These are just silly extra stuff if we wanna go overboard.             %
% They say to maximize rules anyways. These are just adding genders to   %
%   the rules above.                                                     %
% -----------------------------------------------------------------------%

% daughter(X,Y)
% son(X,Y)
% brother(X,Y)
% mother(X,Y)
% grandchild(X,Y)
% grandmother(X,Y)
% grandfather(X,Y)
