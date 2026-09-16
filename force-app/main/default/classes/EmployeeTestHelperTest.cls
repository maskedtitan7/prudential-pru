@isTest
private class EmployeeTestHelperTest {
    @isTest
    static void testCreateSampleEmployee() {
        Test.startTest();
        EmployeeTestHelper.createSampleEmployee();
        Test.stopTest();

        List<Employee__c> employees = [
            SELECT Id, Employee_Code__c, Active__c, Department__c
            FROM Employee__c
            WHERE Employee_Code__c = 'EMP-001'
        ];

        System.assertEquals(1, employees.size(), 'Expected one Employee__c record to be created');
        System.assertEquals(true, employees[0].Active__c, 'Expected Active__c to be true');
    }
}
