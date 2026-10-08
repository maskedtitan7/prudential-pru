public with sharing class TrainingCourseController {
    @AuraEnabled(cacheable=true)
    public static List<Training_Course__c> getCourses() {
        return [
            SELECT Id, Name, Status__c, Duration_Hours__c, Capacity__c
            FROM Training_Course__c
            ORDER BY Name
            LIMIT 50
        ];
    }
}