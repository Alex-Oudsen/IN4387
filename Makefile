MODEL_NAME = Railway_crossing
PFL = Verified_model
TFL = Verified_model/Verification_files


FILES = $(PFL)/$(MODEL_NAME).lts \
	$(PFL)/$(MODEL_NAME).lps

TESTS = $(TFL)/0-No_deadlock_is_present_in_the_system.bool \
	$(TFL)/1-The_barriers_are_set_when_a_train_passes_over_the_crossing.bool \
	$(TFL)/1a-Trains_cannot_cross_if_the_barriers_are_raised_init.bool \
	$(TFL)/1b-Trains_cannot_cross_if_the_barriers_are_raised_no_init.bool \
	$(TFL)/2-The_barriers_cannot_be_set_when_there_are_no_trains_present.bool \
	$(TFL)/2a-The_barriers_cannot_be_set_when_there_are_no_trains_present_init.bool \
	$(TFL)/2b-The_barriers_cannot_be_set_when_there_are_no_trains_present_no_init.bool \
	$(TFL)/3-The_bell_cannot_turn_on_when_there_are_no_trains_present.bool \
	$(TFL)/3a-The_bell_cannot_turn_on_when_there_are_no_trains_present_init.bool \
	$(TFL)/3b-The_bell_cannot_turn_on_when_there_are_no_trains_present_no_init.bool \
	$(TFL)/4-The_lights_cannot_turn_on_when_there_are_no_trains_present.bool \
	$(TFL)/4a-The_lights_cannot_turn_on_when_there_are_no_trains_present_init.bool \
	$(TFL)/4b-The_lights_cannot_turn_on_when_there_are_no_trains_present_no_init.bool \
	$(TFL)/5-The_bell_cannot_turn_on_if_the_lights_have_not_yet_been_turned_on.bool \
	$(TFL)/5a-The_bell_cannot_turn_on_if_the_lights_have_not_yet_been_turned_on_init.bool \
	$(TFL)/5b-The_bell_cannot_turn_on_if_the_lights_have_not_yet_been_turned_on_no_init.bool \
	$(TFL)/6-The_barriers_cannot_be_set_if_the_bell_has_not_yet_been_turned_on.bool \
	$(TFL)/6a-The_barriers_cannot_be_set_if_the_bell_has_not_yet_been_turned_on_init.bool \
	$(TFL)/6b-The_barriers_cannot_be_set_if_the_bell_has_not_yet_been_turned_on_no_init.bool \
	$(TFL)/7-The_bell_cannot_be_turned_off_if_the_barriers_are_set.bool \
	$(TFL)/8-The_lights_cannot_be_turned_off_if_the_bell_is_on.bool \
	$(TFL)/9-The_barriers_cannot_be_raised_if_there_is_a_train_present.bool \
	$(TFL)/10-From_every_reachable_state_there_is_a_sequence_of_actions_to_a_state_in_which_the_barriers_are_raised.bool \
	$(TFL)/11-From_every_reachable_state_there_is_a_sequence_of_actions_to_a_state_in_which_the_barriers_are_set.bool \


ETFL = Verified_model/Verification_files/Extended_model
EXTENDED_FILES = $(PFL)/$(MODEL_NAME).lts \
	$(PFL)/$(MODEL_NAME).lps

EXTENDED_TESTS = \
	$(ETFL)/0-No_deadlock_is_present_in_the_system.bool \
	$(ETFL)/1-The_barriers_are_set_when_a_train_passes_over_the_crossing.bool \
	$(ETFL)/1a-Trains_cannot_cross_if_the_barriers_are_raised_init.bool \
	$(ETFL)/1b-Trains_cannot_cross_if_the_barriers_are_raised_no_init.bool \
	$(ETFL)/2-The_barriers_cannot_be_set_when_there_are_no_trains_present.bool \
	$(ETFL)/2a-The_barriers_cannot_be_set_when_there_are_no_trains_present_init.bool \
	$(ETFL)/2b-The_barriers_cannot_be_set_when_there_are_no_trains_present_no_init.bool \
	$(ETFL)/3-The_bell_cannot_turn_on_when_there_are_no_trains_present.bool \
	$(ETFL)/3a-The_bell_cannot_turn_on_when_there_are_no_trains_present_init.bool \
	$(ETFL)/3b-The_bell_cannot_turn_on_when_there_are_no_trains_present_no_init.bool \
	$(ETFL)/4-The_lights_cannot_turn_on_when_there_are_no_trains_present.bool \
	$(ETFL)/4a-The_lights_cannot_turn_on_when_there_are_no_trains_present_init.bool \
	$(ETFL)/4b-The_lights_cannot_turn_on_when_there_are_no_trains_present_no_init.bool \
	$(ETFL)/5-The_bell_cannot_turn_on_if_the_lights_have_not_yet_been_turned_on.bool \
	$(ETFL)/5a-The_bell_cannot_turn_on_if_the_lights_have_not_yet_been_turned_on_init.bool \
	$(ETFL)/5b-The_bell_cannot_turn_on_if_the_lights_have_not_yet_been_turned_on_no_init.bool \
	$(ETFL)/6-The_barriers_cannot_be_set_if_the_bell_has_not_yet_been_turned_on.bool \
	$(ETFL)/6a-The_barriers_cannot_be_set_if_the_bell_has_not_yet_been_turned_on_init.bool \
	$(ETFL)/6b-The_barriers_cannot_be_set_if_the_bell_has_not_yet_been_turned_on_no_init.bool \
	$(ETFL)/7-The_bell_cannot_be_turned_off_if_the_barriers_are_set.bool \
	$(ETFL)/8-The_lights_cannot_be_turned_off_if_the_bell_is_on.bool \
	$(ETFL)/9-The_barriers_cannot_be_raised_if_there_is_a_train_present.bool \
	$(ETFL)/10-From_every_reachable_state_there_is_a_sequence_of_actions_to_a_state_in_which_the_barriers_are_raised.bool \
	$(ETFL)/11-From_every_reachable_state_there_is_a_sequence_of_actions_to_a_state_in_which_the_barriers_are_set.bool \

all: $(FILES)
tests: $(TESTS)

extended: $(EXTENDED_FILES)
extended-tests: $(EXTENDED_TESTS)

%.lps: %.mcrl2
	mcrl22lps $< $@

%.lts: %.lps
	lps2lts $< $@

%.pbes: %.mcf $(PFL)/$(MODEL_NAME).lps
	lps2pbes -f$< $(PFL)/$(MODEL_NAME).lps $@

%.bool: %.pbes
	@echo "Running test: $<"
	@pbes2bool $<

clean:
	rm -f $(PFL)/*.lps
	rm -f $(PFL)/*.lts
