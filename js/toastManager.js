// ToastManager.js
export class ToastManager {
    constructor() {
        this.container = document.getElementById('toast-container');
        if (!this.container) {
            this.container = document.createElement('div');
            this.container.id = 'toast-container';
            this.container.className = 'fixed top-4 right-4 z-50';
            document.body.appendChild(this.container);
        }
    }

    show(message, type = 'error') {
        const toast = document.createElement('div');
        let bgColor, iconColor, icon;
        
        switch(type) {
            case 'success':
                bgColor = 'bg-green-100';
                iconColor = 'text-green-500';
                icon = `<svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5Zm3.707 8.207-4 4a1 1 0 0 1-1.414 0l-2-2a1 1 0 0 1 1.414-1.414L9 10.586l3.293-3.293a1 1 0 0 1 1.414 1.414Z"/>
                </svg>`;
                break;
            case 'error':
                bgColor = 'bg-red-100';
                iconColor = 'text-red-500';
                icon = `<svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5Zm3.707 11.793a1 1 0 1 1-1.414 1.414L10 11.414l-2.293 2.293a1 1 0 0 1-1.414-1.414L8.586 10 6.293 7.707a1 1 0 0 1 1.414-1.414L10 8.586l2.293-2.293a1 1 0 0 1 1.414 1.414L11.414 10l2.293 2.293Z"/>
                </svg>`;
                break;
            case 'warning':
                bgColor = 'bg-orange-100';
                iconColor = 'text-orange-500';
                icon = `<svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM10 15a1 1 0 1 1 0-2 1 1 0 0 1 0 2Zm1-4a1 1 0 0 1-2 0V6a1 1 0 0 1 2 0v5Z"/>
                </svg>`;
                break;
        }

        toast.className = `flex items-center w-full max-w-xs p-4 mb-4 text-gray-500 bg-white rounded-lg shadow transition-all transform translate-y-0 opacity-100 duration-300 ease-in-out`;
        toast.innerHTML = `
            <div class="inline-flex items-center justify-center flex-shrink-0 w-8 h-8 ${iconColor} ${bgColor} rounded-lg">
                ${icon}
            </div>
            <div class="ms-3 text-sm font-normal">${message}</div>
            <button class="ms-auto -mx-1.5 -my-1.5 bg-white text-gray-400 hover:text-gray-900 rounded-lg p-1.5 hover:bg-gray-100 inline-flex items-center justify-center h-8 w-8">
                <svg class="w-3 h-3" aria-hidden="true" fill="none" viewBox="0 0 14 14">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                </svg>
            </button>
        `;

        // Animation d'entrée
        toast.style.transform = 'translateY(-1rem)';
        toast.style.opacity = '0';
        this.container.appendChild(toast);

        // Force a reflow
        toast.offsetHeight;

        // Déclencher l'animation d'entrée
        toast.style.transform = 'translateY(0)';
        toast.style.opacity = '1';

        // Ajouter le gestionnaire de fermeture
        const closeButton = toast.querySelector('button');
        closeButton.onclick = () => {
            // Animation de sortie
            toast.style.transform = 'translateY(-1rem)';
            toast.style.opacity = '0';
            setTimeout(() => toast.remove(), 300);
        };

        // Retirer automatiquement après 3 secondes
        setTimeout(() => {
            if (toast && toast.parentNode) {
                // Animation de sortie
                toast.style.transform = 'translateY(-1rem)';
                toast.style.opacity = '0';
                setTimeout(() => toast.remove(), 300);
            }
        }, 3000);
    }
}