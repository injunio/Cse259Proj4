% create the function "runIt" that runs the entire thing here:
runIt :-
    write('Is redhair the daughter of i?: '),
    (daughter(red_hair_grown_daughter_of_widow, i) -> write('true'); write('false')), nl,

    write('Is redhair the mother of i?: '),
    (mother(red_hair_grown_daughter_of_widow, i) -> write('true'); write('false')), nl,

    write('Is dad the son in law of i?: '),
    (parent_in_law(i, my_father) -> write('true'); write('false')), nl,

    write('Is baby the brother of dad?: '),
    (brother(bouncing_baby_boy, my_father) -> write('true'); write('false')), nl,

    write('Is baby the brother-in-law of dad?: '), 
    (sibling_in_law(bouncing_baby_boy,my_father)->write('true'); write('false')),nl,

    write('Is baby the uncle of i?: '), 
    (uncle(bouncing_baby_boy, i) -> write('true'); write('false')),nl,

    write('Is baby the brother of redhair?: '),
    (brother(bouncing_baby_boy, red_hair_grown_daughter_of_widow) -> write('true'); write('false')), nl,

    write('Is onrun the grandchild of i?: '),
    (grandchild(on_the_run_kid, i)->write('true'); write('false')),nl,

    write('Is widow the mother of rehair?: '),
    (mother(pretty_widow, red_hair_grown_daughter_of_widow) -> write('true'); write('false')), nl,

    write('Is widow the grandmother of i?: '),
    (grandmother(pretty_widow, i) -> write('true'); write('false')), nl,

    write('Is i the grandchild of widow?: '),
    (grandchild(i, pretty_widow)->write('true'); write('false')), nl,

    write('Is i the grandfather of i?: '),
    (grandfather(i,i) -> write('true'); write('false')), nl,
    
    write('Is John his own grandfather?: '),
    (grandfather(i,i) -> write('true'); write('false')).

% -----------------------------------------------------------------------%
%                                                                        %
% HERE ARE OUR FACTS                                                     %
%                                                                        %
% -----------------------------------------------------------------------%

% who are male/female
male(i).
male(my_father).
male(bouncing_baby_boy).
male(on_the_run_kid).
female(pretty_widow).
female(red_hair_grown_daughter_of_widow).

% who are married
% the fact is a biconditional
married(i,pretty_widow).
married(pretty_widow,i).
married(my_father,red_hair_grown_daughter_of_widow).
married(red_hair_grown_daughter_of_widow,my_father).

% children facts 
% child_of(kid, parent1, parent 2)
% there are two parents to make this easier to figure out who are the bio parents and step-parents
child_of(i, my_father, unknown).
child_of(i, unknown, my_father).
child_of(bouncing_baby_boy, pretty_widow, i).
child_of(bouncing_baby_boy, i, pretty_widow).
child_of(red_hair_grown_daughter_of_widow, unknown, pretty_widow).
child_of(red_hair_grown_daughter_of_widow, pretty_widow, unknown).
child_of(on_the_run_kid, my_father, red_hair_grown_daughter_of_widow).
child_of(on_the_run_kid, red_hair_grown_daughter_of_widow, my_father).


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
    biological_parent(X,Y);
    step_parent(X,Y).

% parent_in_law(X,Z) X is parent of persons spouse, Z is person in question
parent_in_law(X,Z) :-
    married(Z,Y),
    parent(X,Y).

% step_parent(X,Z) X is parent, Z is child
step_parent(X,Z) :-
    not(child_of(Z,X,W)),
    child_of(Z,W,_),
    married(X,W).

% biological_parent(X,Y) X is parent, Y is child
biological_parent(X,Y) :-
    child_of(Y,X,_).


% grandparent(X,Y) X is grandparent, Y is grandchild
grandparent(X,Y) :-  
    parent(X,Z), parent(Z,Y); 
    parent_in_law(X,Z), parent(Z,Y).

% sibling(X,Y)  X is the sibling of Y, meaning they have at least one shared parent 
sibling(X,Y) :-
    parent(Z,X), parent(Z,Y).

% sibling_in_law(X,Y) X is the sibling in law of Y, meaning X is married to the sibling of Y or Y is married to the sibling of X
sibling_in_law(X,Y) :- 
    married(X,Z), sibling(Z,Y); 
    married(Y,Z), sibling(Z,X).

% uncle_aunt(X,Z) X is uncle/aunt and Z is niece/nephew, meaning X is sibling of the parent of Z, or Z is the child_of the sibling of X
uncle_aunt(X,Z):- 
    parent(Y,Z),
    sibling(X,Y);sibling(Y,X).

% uncle(X,Z) X is the uncle of Z 
uncle(X,Z) :- uncle_aunt(X,Z), male(X).

% aunt(X,Z) X is the aunt of Z 
aunt(X,Z) :- uncle_aunt(X,Z), female(X).

% mother(X,Y) X is the mother of Y
mother(X,Y) :- parent(X,Y), female(X).

% grandchild(X,Y) X is grandchild, Y is grandparent 
grandchild(X,Y) :- grandparent(Y,X).


% grandmother(X,Y) X is the grandmother of Y
grandmother(X,Y) :- grandparent(X,Y), female(X).

% grandfather(X,Y) X is the grandfather of Y
grandfather(X,Y) :- grandparent(X,Y), male(X).

% brother(X,Y) X is the brother of Y
brother(X,Y) :- sibling(X,Y), male(X).

% daughter(X,Y) X is the daughter of Y
daughter(X,Y) :- parent(Y,X), female(X).

% son(X,Y) X is the son of Y
son(X,Y) :- parent(Y,X), male(X).

