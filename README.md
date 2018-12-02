# OpK.jl - Opinionated Forward and Inverse Kinematics for Julia

This package provides a way to calculate forward and (approximative, numeric) inverse (with the help of e.g. ForwardDiff.jl) kinematics of rigid mechanisms.

NOTE: This is not finished in any way yet, so don't expect ANY functionality at all at this point..

# Rationale

A forward kinematics of a rigid mechanism in the sense of this library is a function (parametrized with <pre>n</pre> control variables <pre>q_1, ..., q_n</pre>) that maps <pre>m</pre> (homogenous) vectors from <pre>m</pre>link dependent frames into a global frame: 

<pre>
(v'_1, ..., v'_m) = F([q_1, ..., q_n], (v_1, ..., v_m))
</pre>

Particular choices of tasks that go beyond simple coordinate transforms can be represented by functions on the transformed vectors <pre>v'</pre>:

<pre>
(t_1, ..., t_o) = T(F([q_1, ..., q_n], (v_1, ..., v_m)))
</pre>

(For the case of simple coordinate transforms we can just leave out <pre>T</pre>).

Once we have <pre>T(F)</pre> in a functional form in julia, we can, for a particular choice of <pre>V = (v_1, .., v_m)</pre> derive a function that only depends on the q's:

<pre>
q -> T(F(q, V))
</pre>

which we can then feed into e.g. ForwardDiff.jl to calculate a jacobian at a particular configuration p:

<pre>
j = ForwardDiff.jacobian(q -> T(F(q, V)), p)
</pre>

From this point on, we can use e.g. a jacobian pseudo-inverse approach to update the configuration <pre>p</pre> iteratively to solve the inverse kinematics problem.

This library provides the building blocks for assembling functions like <pre>F</pre>. Let's consider a simple example: A robotic arm with three links with rotational joints.

<pre>
(v'_1, v'_2, v'_3) = F([q_1, q_2, q_3], (v_1, v_2, v_3))
</pre>



We factor this problem in the following way:

* <pre>V = vcat(v_1, ..., v_n)</pre>, i.e. We stack 
