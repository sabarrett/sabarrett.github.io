---
title: Hooke's Law, Sine, and Differential Equations
date: 2022-10-17
draft: true
---

_**Note:** This was published a few years before I started this blog,
and if I were writing it again I'd do it differently. Then again, many
of the things I'd change are because I understand mathematics a little
better now, and this article reflects a time where I transitioned from
not understanding something to suddenly understanding it. I can't
re-experience that transition, so I can't rewrite this in a way that
genuinely reflects that experience. Therefore, I've kept things as
they are._

---
When I was an undergrad, I had to take an intro physics course. I
liked it quite a bit, but there were a few concepts that I felt were
brushed over a bit quickly. Outside of my math and computer science
classes, I didn't tend to ask many questions, so I just sat on these
questions for a long time. One of them was about how the kinematic
equations relate to differentiation/integration (I eventually found my
answer here). Another was on the equation that governs the motion of
springs, Hooke's Law.


Hooke's Law can be formulated a few different ways, but I like to
think of it as the force a spring exerts on an object it's attached
to. Formally, it looks like this $$F=-kx$$ where $F$ is the force
exerted by the spring, $k$ is a constant that indicates the stiffness
of the spring, and $x$ is the spring's offset from its rest length.


![An object attached to a spring.](spring-thing.png)

In the above illustration, we can see $-x$, which pulls the attached
object back towards the spring's rest length. A stiffer spring with a
larger $k$ will pull harder. Note that if the red block was closer to
the gray block so that the spring was forced to compress, the red
block would be pushed away from the gray block instead of towards it.
Springs apply force to objects they're attached to in a manner that
brings them closer to their rest length.

When I first learned about this, I found it pleasing that spring
forces result in such a simple equation. What I found odd, though, is
that, when a spring pulls on an object, the object's position over
time forms a sine wave:


![Green is kx, red is sin x](sin-line-graph.png) Green: $kx$ (for some
small k). Red: $\sin x$.

You don't typically see a linear function and a trigonometric function
sitting side-by-side! I found this pretty mystifying. The way I
thought of it was something like this:

$$\text{Force} = -kx$$

1. Force acts on acceleration
2. Acceleration is the second derivative of position
3. Integration is the inverse operation of differentiation
4. Therefore, the second integral of $-kx$ is $\sin x$ -- that is,
   $\iint kx = \sin x$

That's pretty dubious! No wonder I was flummoxed.[^1] The problem I
encountered without realizing it is, even though $F=kx$ looks linear,
$x$ is doing a lot of work. It doesn't represent an independent
variable, as seen in the above graph. Rather, it represents a distance
from the spring's offset, something like $x = r - p(t)$, which is rest
length, $r$, minus position at time $t$, $p(t)$ (though even that
expanded formula only works when the spring in question is at the
origin -- otherwise we'd need yet another term).

The reason that's weird is that F is dependent on the position of the
object. Position depends on acceleration, which depends on the force
acting on the object, which depends on the object's position! We have
a strange little feedback loop, here. Intuitively, though, a feedback
loop is exactly the kind of thing that might produce something like a
sine wave.[^2]

Here's how I reframed this to get the right answer and to have it make
a bit more sense.

Consider our simplified case: a spring at the origin, who's rest
length is 0 and for whom $k=1$. Assume an object with unit mass
($m=1$) is attached to this spring, that the spring is the only force
acting on it. By definition, acceleration at some time $t$ is equal to
the second derivative of position at that same time: $$a(t) =
\frac{d^2}{dt^2}p(t)$$ Also, by Newton's second law, force is mass
times acceleration: $$\Sigma F=ma$$ and since $m = 1$, $$a = \Sigma
F$$ and since our spring force is all that's acting on the object, $$a
= F_{spring}$$

Since our spring is at 0 (the origin), and has a rest length of 0,
that means when the object is at 5, the spring will pull it back
towards the origin, exactly in proportion to the object's distance
from the origin. So, $x = 5$, and $F=-kx=-(1)*5=-5$. When our object
is at -5, the spring will again pull it back towards the origin, this
time moving it in the positive direction, so $x = -5$ and $F=-(-5)=5$.
In other words, $x = p(t)$ and $F = -x = -p(t)$.

This is our key insight! Let's see what happens when we plug in our
value for F: $$a = F = -p(t)$$ $$a = -p(t)$$

Replacing $a$ for it's derivative form, we have:
$$\frac{d^2}{dt^2}p(t) = -p(t)$$

So, the formula for our position function, $p(t)$, is a function whose
second derivative is $-p(t)$. We need a function whose second
derivative is itself, negated! We have several options that fit the
bill, but the simplest I know is $\sin x$ (and all the other ones I
know are trig functions, anyway).

So, $$\frac{d^2}{dt^2}p(t) = -p(t) \therefore p(t) = \sin x$$

To summarize: The force equation $F=-kx$ appears to be linear with
respect to the independent variable $x$, but $x$ is not an independent
variable. $x$ is dependent on an object's position, $p(t)$. Force
depends on position, position depends on acceleration, and
acceleration depends on force. That feedback gives us our "springing,"
oscillating motion. By examining position and acceleration through the
lens of derivatives, we can see why $p(t) = \sin x$ makes sense as a
consequence of Hooke's Law.

I've never taken a differential equations course before, so I don't
know how to formalize this, but I found things "clicked" much better
once I put these pieces together to get this result. I wish I could go
back and explain this to my younger self!

[^1]: I would have figured this out sooner if I'd noticed that I
    wasn't integrating with respect to anything. I was probably
    thinking it was with respect to $dx$, but I didn't have a clear
    idea in my head right away.

[^2]: My first pass at solving this problem was to use the kinematic
    equation for position: $p(t) = p_0 + v_0t + \frac{1}{2}at^2$,
    plugging in $a = -p(t)$. I was hoping I'd end up with an infinite
    series $p(t) = t - \frac{t^3}{3!} + \frac{t^5}{5!} - ...$, which
    is the Taylor series definition of sine. It didn't even come close
    to working out, in no small part because acceleration must be
    constant for the kinematic equations to hold. Still, if anyone
    knows a way to get a Taylor series definition of position using
    Hooke's Law, I'd love to see it!
