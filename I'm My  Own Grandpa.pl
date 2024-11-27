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
married(me,pretty_widow).
married(my_father,red_hair_grown_daughter_of_widow).

% parent(parent,kid)
% the rest of the parent child relationships will be clear because of the parent rule
parent(father,me).
parent(me,bouncing_baby_boy).
parent(pretty_widow,red_hair_grown_daughter_of_widow).

% -----------------------------------------------------------------------
% HERE ARE OUR RULES
% maximize these 
% below are the example rules we can use from the slides

% wife(X,Y)
% married(X, Y) dunno know if we need this since we already have the married as a fact
% parent(X,Y)
% parent_in_law(X,Z)
% step_parent(X,Y)
% biological_parent(X,Y)
% grandparent(X,Y)
% sibling(X,Y)
% sibling_in_law(X,Y)
% uncle_ant(X,Z)
