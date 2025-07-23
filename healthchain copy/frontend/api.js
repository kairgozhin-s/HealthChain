//API
const API_URL = 'http://localhost:3000/api';
console.log('API loaded');
const api = {
    async addWalletActivity(walletAddress) {
        return await this.addActivity("U001", "WALLET_CONNECT", 
            `Connected wallet: ${walletAddress.slice(0, 8)}...`);
    },


    async verifyWallet(walletAddress) {
        return true;
    },

    async getActivities(userId) {
        const response = await fetch(`${API_URL}/activities/${userId}`);
        return await response.json();
    },

    async getHealthStatus(userId) {
        const response = await fetch(`${API_URL}/health-status/${userId}`);
        return await response.json();
    },

    async addActivity(userId, activityType, description) {
        const response = await fetch(`${API_URL}/activities`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ userId, activityType, description })
        });
        return await response.json();

    },

    async updateHealthStatus(userId, status) {
        const response = await fetch(`${API_URL}/health-status`, {
               method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                userId,


                condition: status.condition,
                checkupDate: status.checkupDate,
                vitalSigns: status.vitalSigns
            })
        });
        return await response.json();
    }
};

async function updateDashboard() {
    try {
        const userId = 'U001';
        console.log('Fetching activities...');
        const activities = await api.getActivities(userId);
        console.log('Activities received:', activities);
        
        console.log('Fetching health status...');


        const status = await api.getHealthStatus(userId);
        console.log('Health status received:', status);
        

    } catch (error) {
        console.error('Error updating dashboard:', error);
    }
    
}
