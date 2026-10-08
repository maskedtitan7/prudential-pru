@isTest
private class TrainingCourseTriggerHandlerTest {
    @isTest
    static void validCourseIsInserted() {
        Training_Course__c course = new Training_Course__c(
            Name = 'Apex Basics',
            Capacity__c = 20,
            Duration_Hours__c = 4
        );

        Test.startTest();
        insert course;
        Test.stopTest();

        System.assertEquals(
            1,
            [SELECT COUNT() FROM Training_Course__c WHERE Name = 'Apex Basics'],
            'Valid course should be saved'
        );
    }

    @isTest
    static void invalidCapacityIsRejectedOnInsert() {
        Training_Course__c course = new Training_Course__c(Name = 'Bad Course', Capacity__c = 0);
        Boolean threw = false;

        Test.startTest();
        try {
            insert course;
        } catch (DmlException e) {
            threw = true;
            System.assert(e.getMessage().contains('Capacity'), 'Error should mention Capacity');
        }
        Test.stopTest();

        System.assert(threw, 'Insert with capacity 0 should fail');
    }

    @isTest
    static void invalidCapacityIsRejectedOnUpdate() {
        Training_Course__c course = new Training_Course__c(Name = 'Update Course', Capacity__c = 10);
        insert course;
        Boolean threw = false;

        Test.startTest();
        try {
            course.Capacity__c = -5;
            update course;
        } catch (DmlException e) {
            threw = true;
        }
        Test.stopTest();

        System.assert(threw, 'Update to a negative capacity should fail');
    }
}
