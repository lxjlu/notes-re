import numpy as np
from scipy.integrate import odeint
import matplotlib.pyplot as plt

# Define the differential equation y'=df
def df(x, y):
    return y*(y-1)*(2-y)

# Make the figure output 12 inches by 9 inches
fig = plt.figure(figsize=(12, 9))
ax = fig.add_subplot(111)

# Mesh Grid for the Direction Field
minx = 0.0
maxx = 4.0
xsteps = 20
miny  = 0.0
maxy = 4.0
ysteps = 20
x, y = np.meshgrid(np.linspace(minx, maxx, xsteps), np.linspace(miny, maxy, ysteps))

# Direction Values for the Vectors

u = x - x + 1
v = 1*df(x, y)

# Normalize the Vectors so they are the same size

r = np.power( np.add( np.power(u,2), np.power(v,2)), 0.5)

# Use vectors with no arrow heads
plt.quiver(x, y, u/r, v/r, angles="xy", headwidth=0)

# Find the solution to IVP
solutionSteps = 101
p0 = 2.5
t = np.linspace(minx, maxx, solutionSteps)
Sol1 = odeint(df, p0, t, tfirst=True)

p0 = 2.0
Sol2 = odeint(df, p0, t, tfirst=True)

p0 = 1.7
Sol3 = odeint(df, p0, t, tfirst=True)

p0 = 1.0
Sol4 = odeint(df, p0, t, tfirst=True)

p0 = 0.9
Sol5 = odeint(df, p0, t, tfirst=True)

p0 = 0.8
Sol6 = odeint(df, p0, t, tfirst=True)

p0 = 0.0
Sol7 = odeint(df, p0, t, tfirst=True)

plt.plot(t, Sol1, 'k')
plt.plot(t, Sol2, 'r')
plt.plot(t, Sol3, 'orange')
plt.plot(t, Sol4, 'y')
plt.plot(t, Sol5, 'g')
plt.plot(t, Sol6, 'b')
plt.plot(t, Sol7, 'purple')
plt.show()