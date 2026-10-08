public with sharing class TrainingCourseTriggerHandler {
    public static void validate(List<Training_Course__c> courses) {
        for (Training_Course__c course : courses) {
            if (course.Capacity__c != null && course.Capacity__c < 1) {
                course.addError('Capacity must be at least 1.');
            }
        }
    }
}
