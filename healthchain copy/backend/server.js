const express = require('express');
const cors = require('cors');
const testData = require('./testData.json');
const app = express();

app.use(cors());
app.use(express.json());
app.get('/api/activities/:userId', (req, res) => {
    const activities = testData.activities[req.params.userId] || [];
    res.json(activities);
});


app.get('/api/health-status/:userId', (req, res) => {
    //Health status


    const status = testData.healthStatus[req.params.userId] || {};
    res.json(status);
});


app.get('/api/staff/patients/:staffId', (req, res) => {
    const staff = testData.medicalStaff.find(s => s.staff_id === req.params.staffId);
    //Patient records (for medical staff)


    if (!staff) {
        res.json([]);
        return;
    }

    const patients = staff.patients.map(patientId => {
        const user = testData.users.find(u => u.user_id === patientId);
        const status = testData.healthStatus[patientId];
        return {
            ...user,
            condition_status: status?.condition,
            last_checkup: status?.last_checkup,
            vital_signs: status?.vital_signs
        };
    });
    
    res.json(patients);
});
app.post('/api/activities', (req, res) => {
    const { userId, activityType, description } = req.body;
    const newActivity = {
        timestamp: new Date().toISOString(),
        type: activityType,
        description
    };
//te
    if (!testData.activities[userId]) {
        testData.activities[userId] = [];
    }
    testData.activities[userId].unshift(newActivity);
    
    res.json({ success: true, activity: newActivity });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {

    
    console.log(`Server running on port ${PORT}`);
});