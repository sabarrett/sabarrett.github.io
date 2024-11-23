---
title: Physics Week 2
draft: yes
---

# Calculus refresher

[Def\'n:]{.underline} **Derivative** is instantaneous change of one variable with respect to another. This is formally described as

$$\lim_{h \to 0}\frac{f(x+h)-f(x)}{h}$$

::: ADMONITION
This formal definition will not come up frequently in our class, but it
is still useful to be familiar with.
:::

## Notation

The derivative of the function y with respect to the variable x is
written as either $y'$ or $\frac{dy}{dx}$ Sometimes we see two separate
steps: $$y = x^2-3$$ $$y' = \frac{dy}{dx} = 2x-3$$

But we can simplify this to one step:

$$\frac{d}{dx}x^2-3=2x-3$$

Both mean \"the derivative of $x^2-3$ is $2x-3$\".

# Calculus

Position is an object\'s location in space, represented as a vector of 2 or 3 dimensions (for 2D/3D respectively).

[Link to further lecture notes.](phys-week3.org)

We write position as $\vec{x}$.

Velcocity is the instantaneous change in position over time.

$$\vec{v} = \frac{d}{dt}{\vec{x}}$$

Acceleration is the instantaneous change in velocity over time.

$$\vec{a} = \frac{d}{dt}\vec{v}$$ Substituting $\vec{v}$ for
$\frac{d}{dt}\vec{x}$, we get:
$$\vec{a} = \frac{d}{dt}\frac{d}{dt}\vec{x}$$

Or, as we prefer to write it,

$$\vec{a} = \frac{d^2}{dt^2}\vec{x}$$

It follows that, if an acceleration of a given particle is constant, we
can calculate its position after some amount of time as

$$\vec{x}_1 = \vec{x}_0 + \vec{v}t + \frac{1}{2}\vec{a}t^2$$

Where x1 is the position after some time t, and x0 is the initial
position. A derivation of this fact is available
[here](https://phys.libretexts.org/Bookshelves/University_Physics/Book%3A_University_Physics_(OpenStax)/Book%3A_University_Physics_I_-_Mechanics_Sound_Oscillations_and_Waves_(OpenStax)/03%3A_Motion_Along_a_Straight_Line/3.08%3A_Finding_Velocity_and_Displacement_from_Acceleration).

# Particles

A particle is simply a single object.

Particles have:

-   Position
-   Velocity
-   Acceleration

We will further build on particles throughout this course.

# Newton\'s First Two Laws of Motion

1.  Object maintains is velocity unless a force acts upon it

    If you\'ve heard this law before you probably heard it as \"An
    object in motions stays in motion and an object at rest stays at
    rest unless acted upon by an outside force\"

2.  A force acting upon an object produces force that is inversely
    proportional to the object\'s mass

    This introduces the idea of a \"force,\" which we don\'t yet have
    represented in our Particle class.

# Newton\'s First Law

In essence, velocity does not (usually) change directly. Instead, it is
changed by acceleration.

We will hard-code drag into our physics engine instead of using forces
explicitly. The textbook refers to this hard-coded drag value as
\"damping\" so as not to confuse it for real forces.

Hard-coding drag will keep errors from accumulating in our floating
point arithmetic. Adding many vectors together over and over again could
otherwise cause small floating point precision errors that may add up to
visibly significant changes in velocity.

# Newton\'s Second Law

This is usually succinctly written as $\Sigma F=ma$. That is, the sum of
the forces operating on a particle is equal to its mass times its
acceleration. Rewriting this to solve for acceleration, we can get:

$$a = \frac{\Sigma F}{m}$$

Big idea: Acceleration is changed by forces. If we apply forces to an
object, even if those forces change rapidly from moment to moment, **the
object\'s motion will appear natural**. This is exactly what we want!

## Gravity

Gravity is a fundamental force of the universe. All objects attract each
other proportional to their masses and the gravitational constant. That
is, the force of gravity acting on any two given particles is

$$F_{gravity}=G\frac{m_1m_2}{r^2}$$

Where G is the universal gravitational constant, the m\'s are the masses
of each object, and r is the distance between the two objects.

Experimentation has shown G is approximately $6.6743 \times 10^{-11}$,
which is quite small! For most objects, it is essentially negligible.
For massive objects, such as planets, it is quite significant.

Since most objects are on earth, we can use a handy constant, g, which
is the force of gravity on earth. To arrive at g, we simply need to
notice that the mass of the earth, the universal gravitational constant,
and the distance from the center of the earth to its surface doesn\'t
change for all objects on the surface of the earth.

$$g=G\frac{m_{earth}}{r^2}$$

g thus turns out to be roughly 9.8m/s² (read as \"meters per second per
second\"). As useful as this is to know, this tends to not be a very
good gravitation constant to pick in games. Players tend to find this
constant results in jumps feeling \"floaty\" -- instead, we prefer to
pick much higher gravitational constants, often around 20m/s², but the
specifics will always depend on the game.

Finally, note that when we use forces to calculate acceleration due to
gravity, we end up with this equation:

$$a=\frac{\Sigma F}{m} = \frac{mg}{m} = g$$

# Game modifications

We will need to add two more variables to our particle class to reflect
these laws:

-   damping (to impose drag)
-   mass (to calculate acceleration)

However, since we see that the equation for acceleration is
$a=\frac{\Sigma F}{m}$, we may notice that we will tend to be dividing
by mass quite a bit more than we\'re multiplying by it. Since division
is an expensive operation and multiplication is a cheap one[^1], we can
choose to store the inverse mass of the object instead of the mass. So,
overall, we\'ll need these instance variables in our particle class:

-   position
-   velocity
-   acceleration
-   damping
-   inverse mass

# The Integrator

-   Modify position
-   Calculate acceleration from forces (just gravity for now)
-   Modify velocity
-   Impose drag ($v_1 = v_0*damping^{duration}$)

[^1]: In general, it usually works to assume that mathematical
    operations that are easy to do for you are easy for the computer to
    do (addition, multiplication, squaring), but that operations that
    are relatively more difficult to do for you are also more difficult
    for the computer (division, square roots, raising to non-integer
    powers).
