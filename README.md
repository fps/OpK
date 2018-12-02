# OpK.jl - Opinionated Forward and Inverse Kinematics for Julia

This package provides a way to calculate forward and (approximative, numeric) inverse (with the help of e.g. ForwardDiff.jl) kinematics of rigid mechanisms.

NOTE: This is not finished in any way yet, so don't expect ANY functionality at all at this point..

# Rationale

A forward kinematics of a rigid mechanism in the sense of this library is a function (parametrized with <code>n</code> control variables <code>q_1, ..., q_n</code>) that maps <code>m</code> (homogenous) vectors from <code>m</code>link dependent frames into a global frame: 

<code>
(v'_1, ..., v'_m) = F([q_1, ..., q_n], (v_1, ..., v_m))
</code>


Particular choices of tasks that go beyond simple coordinate transforms can be recodesented by functions on the transformed vectors <code>v'</code>:

<code>
(t_1, ..., t_o) = T(F([q_1, ..., q_n], (v_1, ..., v_m)))
</code>


(For the case of simple coordinate transforms we can just leave out <code>T</code>).

Once we have <code>T(F)</code> in a functional form in julia, we can, for a particular choice of <code>V = (v_1, .., v_m)</code> derive a function that only depends on the q's:

<code>
q -> T(F(q, V))
</code>


which we can then feed into e.g. ForwardDiff.jl to calculate a jacobian at a particular configuration p:

<code>
j = ForwardDiff.jacobian(q -> T(F(q, V)), p)
</code>


From this point on, we can use e.g. a jacobian pseudo-inverse approach to update the configuration <code>p</code> iteratively to solve the inverse kinematics problem.

This library provides the building blocks for assembling functions like <code>F</code>. Let's consider a simple example: A robotic arm with three links with rotational joints.

<code>
(v'_1, v'_2, v'_3) = F([q_1, q_2, q_3], (v_1, v_2, v_3))
</code>



We factor this problem in the following way:

* <code>V = vcat(v_1, ..., v_n)</code>, i.e. We stack 
