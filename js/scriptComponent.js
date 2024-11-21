// scriptComponent.js
async function loadComponents() {
    try {
        // Charger le header
        const headerResponse = await fetch('component/header.html');
        const headerData = await headerResponse.text();
        document.getElementById('header-container').innerHTML = headerData;

        // Charger le footer
        const footerResponse = await fetch('component/footer.html');
        const footerData = await footerResponse.text();
        document.getElementById('footer-container').innerHTML = footerData;

        // Charger la route si l'élément existe
        const routeContainer = document.getElementById('route-container');
        if (routeContainer) {
            const routeResponse = await fetch('route.html');
            const routeData = await routeResponse.text();
            routeContainer.innerHTML = routeData;
        }


        // Charger le composant météo dans l'onglet settings
        const settingsPanel = document.getElementById('weather');
        if (settingsPanel) {
            const weatherResponse = await fetch('weather.html');
            const weatherData = await weatherResponse.text();
            settingsPanel.innerHTML = weatherData;
        }

        // Important : Mettre à jour l'affichage utilisateur seulement après que tout est chargé
        updateUserHeader();
        initializeAuth();

    } catch (error) {
        console.error('Error loading components:', error);
    }
}

function updateUserHeader() {
    try {
        const userStr = localStorage.getItem('user');
        console.log('UserStr:', userStr);
        
        if (!userStr) {
            throw new Error('No user data');
        }

        const user = JSON.parse(userStr);
        console.log('User data:', user);

        const loginButton = document.getElementById('loginButton');
        const userInfo = document.getElementById('userInfo');
        const userName = document.getElementById('userName');

        if (user && user.prenom && user.nom) {
            console.log('Updating display for:', user.prenom, user.nom);
            
            if (loginButton) {
                loginButton.style.display = 'none';
                loginButton.classList.add('hidden');
            }
            
            if (userInfo && userName) {
                userInfo.style.display = 'flex';
                userInfo.classList.remove('hidden');
                userName.textContent = `${user.prenom} ${user.nom}`;
            }

            const logoutButton = document.getElementById('logoutButton');
            if (logoutButton) {
                logoutButton.onclick = () => {
                    localStorage.removeItem('user');
                    window.location.href = 'login.html';
                };
            }
        }
    } catch (error) {
        console.log('Error in updateUserHeader:', error);
        const loginButton = document.getElementById('loginButton');
        const userInfo = document.getElementById('userInfo');
        
        if (loginButton) loginButton.style.display = 'block';
        if (userInfo) userInfo.style.display = 'none';
    }
}

function initializeAuth() {
    updateUserHeader();
    
    // Gérer le menu mobile
    const mobileMenuBtn = document.querySelector('[data-collapse-toggle="mobile-menu-2"]');
    const mobileMenu = document.getElementById('mobile-menu-2');
    
    if (mobileMenuBtn && mobileMenu) {
        mobileMenuBtn.onclick = () => {
            mobileMenu.classList.toggle('hidden');
        };
    }
}

document.addEventListener('DOMContentLoaded', loadComponents);
window.addEventListener('storage', updateUserHeader);