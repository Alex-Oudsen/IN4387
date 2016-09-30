
FILES = \
	Bridge/Bridge.lts \
	Barriers/Barrier_with_sensors.lts \
	Signals/Signals.lts \
	Complete_tiny.lts \
	Complete_medium.lts \
	Complete.lts

TESTS = \
	tests/1_1_1-pre_before_stop.bool \
	tests/1_1_2-pre_before_stop.bool \
	tests/1_2-stop_check_barrier.bool \
	tests/1_3-pre_check_stop.bool \
	tests/2_1_1-entry_check_stop.bool \
	tests/2_1_2-entry_check_stop.bool \
	tests/2_2-exit_check_entry.bool \
	tests/2_3-barrier_check_pin.bool \
	tests/3_1_1-pins_check_barriers.bool \
	tests/3_1_2-pins_check_barriers.bool \
	tests/3_2_1-pins_check_brake.bool \
	tests/3_2_2-pins_check_closed.bool \
	tests/4_1_1-brake_check_pins.bool \
	tests/4_1_2-brake_check_pins.bool \
	tests/4_2_1-brake_check_motor.bool \
	tests/4_2_2-brake_check_motor.bool \
	tests/4_3_1-motor_check_brake.bool \
	tests/4_3_2-motor_check_brake.bool \
	tests/4_3_3-motor_check_brake.bool \
	tests/4_3_4-motor_check_brake.bool \
	tests/5_1-start_to_open.bool \
	tests/5_2-close_to_open.bool \
	tests/no_deadlock.bool

all: $(FILES)
tests: $(TESTS)

graph-barriers: Barriers/Barrier_with_sensors.graph
graph-bridge: Bridge/Bridge.graph
graph-signals: Signals/Signals.graph
graph-medium: Complete_medium.graph
graph-tiny: Complete_tiny.graph
graph: Complete.graph
sim-barriers: Barriers/Barrier_with_sensors.sim
sim-bridge: Bridge/Bridge.sim
sim-signals: Signals/Signals.sim
sim-medium: Complete_medium.sim
sim-tiny: Complete_tiny.sim
sim: Complete.sim
view-barriers: Barriers/Barrier_with_sensors.view
view-bridge: Bridge/Bridge.view
view-signals: Signals/Signals.view
view-medium: Complete_medium.view
view-tiny: Complete_tiny.view
view: Complete.view

%.lps: %.mcrl2
	mcrl22lps $< $@

%.lts: %.lps
	lps2lts $< $@

Complete_medium.lts: Complete_medium.lps
	lps2lts -rjittyc -v $< $@
Complete.lts: Complete.lps
	lps2lts -rjittyc -v $< $@

%.pbes: %.mcf Complete_medium.lps
	lps2pbes -f$< Complete_medium.lps $@
%.pbes-lps: %.mcf Complete_medium.lps
	lps2pbes -f$< Complete_medium.lps $@
%.pbes-lts: %.mcf Complete_medium.lts
	lts2pbes -f$< Complete_medium.lts $@

%.bool: %.pbes
	@date
	@echo -n "Running test $< ... "
	@pbes2bool $<
%.bool-lps: %.pbes-lps
	@date
	@echo -n "Running test $< ... "
	@pbes2bool $<
%.bool-lts: %.pbes-lts
	@date
	@echo -n "Running test $< ... "
	@pbes2bool $<

%.graph: %.lts
	ltsgraph $<

%.sim: %.lps
	lpsxsim $<

%.view: %.lts
	ltsview $<

clean:
	rm -f */*.lps *.lps
	rm -f */*.lts *.lts
	rm -f */*.pbes *.pbes
	rm -f jittyc_*

