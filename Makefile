MODEL_NAME = Railway_crossing
PFL = Verified_model
TFL = Verified_model/Verification_files

FILES = $(PFL)/$(MODEL_NAME).lts \
	$(PFL)/$(MODEL_NAME).lps

TESTS = $(TFL)/0-No_deadlock_is_present_in_the_system.bool \
	$(TFL)/10-From_every_reachable_state_there_is_a_sequence_of_actions_to_a_state_in_which_the_barriers_are_raised.bool \
	$(TFL)/1a-Trains_can_cross_if_the_barriers_are_set.bool \
	$(TFL)/1b-Trains_cannot_cross_if_the_barriers_are_raised_init.bool \
	$(TFL)/1c-Trains_cannot_cross_if_the_barriers_are_raised_no_init.bool \
	$(TFL)/1-The_barriers_are_set_when_a_train_passes_over_the_crossing.bool \
	$(TFL)/5a-The_bell_cannot_turn_on_if_the_lights_have_not_yet_been_turned_on_init.bool \
	$(TFL)/5b-The_bell_cannot_turn_on_if_the_lights_have_not_yet_been_turned_on_no_init.bool \
	$(TFL)/5-The_bell_cannot_turn_on_if_the_lights_have_not_yet_been_turned_on.bool \
	$(TFL)/6a-The_barriers_cannot_be_set_if_the_bell_has_not_yet_been_turned_on_init.bool \
	$(TFL)/6b-The_barriers_cannot_be_set_if_the_bell_has_not_yet_been_turned_on_no_init.bool \
	$(TFL)/6-The_barriers_cannot_be_set_if_the_bell_has_not_yet_been_turned_on.bool \
	$(TFL)/7-The_bell_cannot_be_turned_off_if_the_barriers_are_set.bool \
	$(TFL)/8-The_lights_cannot_be_turned_off_if_the_bell_is_on.bool \
	$(TFL)/9-From_every_reachable_state_there_is_a_sequence_of_actions_to_a_state_in_which_the_barriers_are_set.bool

all: $(FILES)
tests: $(TESTS)

%.lps: %.mcrl2
	mcrl22lps $< $@

%.lts: %.lps
	lps2lts $< $@

%.pbes: %.mcf $(PFL)/$(MODEL_NAME).lps
	lps2pbes -f$< $(PFL)/$(MODEL_NAME).lps $@

%.bool: %.pbes
	@pbes2bool $<

clean:
	rm -f $(PFL)/*.lps
	rm -f $(PFL)/*.lts

