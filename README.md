# Msc_Thesis 
This code simulates a soft robot with a force feedback controller that is interacting with environment. 

This repo includes a sample code for a simulation I generated for my Msc Thesis. Purpose of this repo is to show my work, so not every data or code is present. The code and data used here is for the last part of my thesis. To get this point, Following procedures were done;

1. Acquire data from the real soft robot.
2. Fit a piecewise constant curvature model (kinematic model) to the soft robot data.
3. Model the soft robot with lumped-mass lagrangian dynamic model and identify the model using the acquired data.
4. Simulate the experiment. Record the data acquired.

The code in this repo uses the recorded data in the previous step as the starting point. In other words, the simulation starts from the point where the soft robot is already interacting with the environment. In the simulation, we assume that the base of the soft robot is attached with a dc motor (or a step motor) and it can rotate from the base. This allows soft robot to move along a surface with constant applied force.

You can access my thesis from this link: https://research.sabanciuniv.edu/id/eprint/47043/1/10335618.pdf

# How to Run the Code
To run the code, you need to simply run the main.m file while having all of the functions and other .m files in the same folder. The Saver.m file saves the data from the simulation, Plotter.m file plots the data and arcplotter.m shows the movement of the show robot and creates a video. By default, Saver() and arcplotter() are run at the end of the main.m and Plotter() is commented out. You can just uncomment Plotter() to plot the data.
