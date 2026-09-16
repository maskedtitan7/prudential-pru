public with sharing class EmployeeTestHelper {
    public static void createSampleEmployee() {
        try {
            Employee__c emp = new Employee__c();
            emp.Employee_Code__c = 'EMP-001';
            emp.Active__c = true;
            emp.Department__c = 'Engineering';
            insert emp;
        } catch (Exception e) {
            // intentionally empty - PMD's EmptyCatchBlock rule should flag this
        }
    }
}
