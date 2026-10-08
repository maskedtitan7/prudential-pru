trigger TrainingCourseTrigger on Training_Course__c (before insert, before update) {
    TrainingCourseTriggerHandler.validate(Trigger.new);
}
