public with sharing class EmployeeTestHelper {
    public static void createSampleEmployee() {
        try {
            Employee__c emp = new Employee__c();
            emp.Employee_Code__c = 'EMP-001';
            emp.Active__c = true;
            emp.Department__c = 'Engineering';
            insert emp;
        } catch (Exception e) {
            // TEMPORARY: surface the real error instead of hiding it.
            // Revert this to an empty catch block once the insert works,
            // so PMD has something to flag again for testing purposes.
            System.debug('EmployeeTestHelper insert failed: ' + e.getMessage());
            throw e;
        }
    }
}