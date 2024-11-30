% create the function "runIt" that runs the entire thing here:

% -----------------------------------------------------------------------%
%                                                                        %
% HERE ARE OUR FACTS                                                     %
%                                                                        %
% -----------------------------------------------------------------------%

% who are male/female
male(i).
male(my_father).
male(bouncing_baby_boy).
male(ne_the_run_kid).
female(pretty_widow).
female(red_hair_grown_daughter_of_widow).

% who are married
% the fact is a biconditional
married(i,pretty_widow).
married(pretty_widow,i).
married(my_father,red_hair_grown_daughter_of_widow).
married(red_hair_grown_daughter_of_widow,my_father).

% child_of(kid, parent1, parent 2)
% there are two parents to make this easier to figure out who are the bio parents and step-parents
child_of(i, my_father, unknown).
child_of(bouncing_baby_boy, pretty_widow, i).
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
    % should we add biological_parent here? 

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

% sibling(X,Y)  X is the sibling of Y, meaning they have at least one shared parent 
% sibling_in_law(X,Y) X is the sibling in law of Y, meaning X is married to the sibling of Y or Y is married to the sibling of X
% uncle_aunt(X,Z) X is uncle/aunt and Z is niece/nephew, meaning X is sibling of the parent of Z, or Z is the child_of the sibling of X


% NOTE: we might have to add these since they were in the test case on the slide, 
%       I just moved them from the last section up here but we can move it back if needed

% mother(X,Y) :- parent(X,Y), female(X)
% grandchild(X,Y) 
% grandmother(X,Y) :- grandparent(X,Y), female(X).
% grandfather(X,Y) :- grandparent(X,Y), male(X).
% brother(X,Y) :- male(X).
% daughter(X,Y) :- child (X,Y), female(Y).

% -----------------------------------------------------------------------%
% These are just silly extra stuff if we wanna go overboard.             %
% They say to maximize rules anyways. These are just adding genders to   %
%   the rules above.                                                     %
% -----------------------------------------------------------------------%

% daughter(X,Y) :- child (X,Y), female(Y)
% son(X,Y) :- child (X,Y), male(Y)

