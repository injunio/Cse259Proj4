% create the function "runIt" that runs the entire thing here:

% -----------------------------------------------------------------------
% HERE ARE OUR FACTS
% minimize these

% 6 lines of male()/female()
male(me).
male(my_father).
male(bouncing_baby_boy).
male(ne_the_run_kid).
female(pretty_widow).
female(red_hair_grown_daughter_of_widow).

% next two are married()
% between me and pretty_widow
% between my father and red_hair_grown_daughter_of_widow

% next 2 are child_of()
% me and father
% baby_boy and me

% -----------------------------------------------------------------------
% HERE ARE OUR RULES
% maximize these 
% below are the example rules we can use from the slides

% wife(X,Y)
% married(X, Y)
% parent(X,Y)
% parent_in_law(X,Z)
% step_parent(X,Y)
% biological_parent(X,Y)
% grandparent(X,Y)
% sibling(X,Y)
% sibling_in_law(X,Y)
% uncle_ant(X,Z)
