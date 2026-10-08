import { LightningElement, wire } from 'lwc';
import getCourses from '@salesforce/apex/TrainingCourseController.getCourses';

const COLUMNS = [
    { label: 'Course', fieldName: 'Name' },
    { label: 'Status', fieldName: 'Status__c' },
    { label: 'Hours', fieldName: 'Duration_Hours__c', type: 'number' },
    { label: 'Capacity', fieldName: 'Capacity__c', type: 'number' }
];

export default class TrainingCourseList extends LightningElement {
    columns = COLUMNS;
    courses;
    error;

    @wire(getCourses)
    wiredCourses({ data, error }) {
        if (data) {
            this.courses = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.courses = undefined;
        }
    }

    get hasCourses() {
        return Array.isArray(this.courses) && this.courses.length > 0;
    }
}
