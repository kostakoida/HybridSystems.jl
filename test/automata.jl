using Test
using HybridSystems

function test_state_prop(automaton)
    prop = HybridSystems.state_property(automaton, Float64)
    @test typeof(prop) == HybridSystems.state_property_type(typeof(automaton), Float64)
    prop[1] = 0.5
    @test prop[1] == 0.5
    iprop = HybridSystems.typed_map(Int, x -> convert(Int, ceil(x)), prop)
    @test typeof(iprop) == HybridSystems.state_property_type(typeof(automaton), Int)
    @test iprop[1] == 1
end

function test_trans_prop(automaton, t1, t2, t3, t4, t5)
    prop = HybridSystems.transition_property(automaton, Int)
    @test typeof(prop) == HybridSystems.transition_property_type(typeof(automaton), Int)
    prop[t2] = 2
    prop[t1] = 3
    prop[t4] = 4
    prop[t3] = 5
    prop[t5] = 1
    @test prop[t5] == 1
    @test prop[t1] == 3
    @test prop[t3] == 5
    @test prop[t2] == 2
    @test prop[t4] == 4
    fprop = HybridSystems.typed_map(Float64, x -> x / 2, prop)
    @test typeof(fprop) == HybridSystems.transition_property_type(typeof(automaton), Float64)
    @test fprop[t4] == 2.0
    @test fprop[t5] == 1/2
    @test fprop[t2] == 1.0
    @test fprop[t3] == 5/2
    @test fprop[t1] == 3/2
end

@testset "Automaton" begin
    @testset "OneStateAutomaton" begin
        automaton = OneStateAutomaton(5)
        t1 = HybridSystems.OneStateTransition(1)
        t2 = HybridSystems.OneStateTransition(2)
        t3 = HybridSystems.OneStateTransition(3)
        t4 = HybridSystems.OneStateTransition(4)
        t5 = HybridSystems.OneStateTransition(5)
        test_state_prop(automaton)
        test_trans_prop(automaton, t1, t2, t3, t4, t5)
        @test ntransitions(automaton) == 5
    end

    @testset "LightAutomaton" begin
        automaton = LightAutomaton(2)
        t1 = add_transition!(automaton, 1, 2, 1)
        t2 = add_transition!(automaton, 1, 1, 1)
        t3 = add_transition!(automaton, 2, 1, 2)
        t4 = add_transition!(automaton, 2, 2, 1)
        t5 = add_transition!(automaton, 1, 2, 2)
        test_state_prop(automaton)
        test_trans_prop(automaton, t1, t2, t3, t4, t5)
        @test ntransitions(automaton) == 5
        rem_transition!(automaton, t5)
        @test ntransitions(automaton) == 4
        rem_transition!(automaton, t1)
        @test ntransitions(automaton) == 3
        rem_transition!(automaton, t2)
        @test ntransitions(automaton) == 2
        t1 = add_transition!(automaton, 1, 2, 1)
        @test ntransitions(automaton) == 3
        t2 = add_transition!(automaton, 1, 1, 1)
        @test ntransitions(automaton) == 4
        t5 = add_transition!(automaton, 1, 2, 2)
        @test ntransitions(automaton) == 5
        t5 = rem_state!(automaton, 2)
        @test ntransitions(automaton) == 1
    end
end