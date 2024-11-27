% create the function "runIt" that runs the entire thing here:

% -----------------------------------------------------------------------
% HERE ARE OUR FACTS
% minimize these

% who are male/female
male(me).
male(my_father).
male(bouncing_baby_boy).
male(ne_the_run_kid).
female(pretty_widow).
female(red_hair_grown_daughter_of_widow).

% who are married
% might have to see how we can make this into a rule
married(me,pretty_widow).
married(pretty_widow,me).
married(my_father,red_hair_grown_daughter_of_widow).
married(red_hair_grown_daughter_of_widow,my_father).

% child_of(kid, parent)
% the rest of the parent child relationships will be clear because of the parent rule
child_of(me,my_father).
child_of(bouncing_baby_boy,me).
child_of(red_hair_grown_daughter_of_widow,pretty_widow).
child_of(on_the_run_kid,red_hair_grown_daughter_of_widow).

% -----------------------------------------------------------------------
% HERE ARE OUR RULES
% maximize these 
% below are the example rules we can use from the slides

% wife(X,Y) X is wife, Y is husband
wife(X,Y) :- female(X), married(Y,X).

% married(X,Y) dunno know if we need this since we already have the married as a fact

% parent(X,Y) X is parent, Y is child
% this function shows parent relations regardless of blood
parent(X,Y) :-
    child_of(Y,X);
    (married(X,Z), child_of(Y,Z)).

% parent_in_law(X,Z)
% step_parent(X,Y)
% biological_parent(X,Y)
% grandparent(X,Y)
% sibling(X,Y)
% sibling_in_law(X,Y)
% uncle_ant(X,Z)
