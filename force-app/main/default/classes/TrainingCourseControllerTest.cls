@isTest
private class TrainingCourseControllerTest {
    @isTest
    static void returnsCourses() {
        insert new List<Training_Course__c>{
            new Training_Course__c(Name = 'Course A', Capacity__c = 10),
            new Training_Course__c(Name = 'Course B', Capacity__c = 15)
        };

        Test.startTest();
        List<Training_Course__c> result = TrainingCourseController.getCourses();
        Test.stopTest();

        System.assertEquals(2, result.size(), 'Both courses should be returned');
    }
}
