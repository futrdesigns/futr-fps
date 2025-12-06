window.addEventListener('message', function(event) {
    const data = event.data;
    
    if (data.action === 'openMenu') {
        const menu = document.getElementById('fps-menu');
        menu.classList.remove('hidden');
    }
});
function closeMenu() {
    const menu = document.getElementById('fps-menu');
    menu.classList.add('hidden');
    
    fetch(`https://${GetParentResourceName()}/closeMenu`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({})
    });
}
function applyPreset(preset) {
    const cards = document.querySelectorAll('.option-card');
    cards.forEach(card => {
        if (card.onclick && card.onclick.toString().includes(preset)) {
            card.style.transform = 'scale(0.95)';
            setTimeout(() => {
                card.style.transform = '';
            }, 200);
        }
    });
    fetch(`https://${GetParentResourceName()}/applyPreset`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            preset: preset
        })
    }).then(() => {
        showNotification(getPresetName(preset));
    });
}

function showNotification(presetName) {
    const notification = document.createElement('div');
    notification.style.cssText = `
        position: fixed;
        top: 20px;
        right: 20px;
        background: linear-gradient(135deg, rgba(79, 209, 197, 0.95) 0%, rgba(34, 211, 238, 0.95) 100%);
        color: white;
        padding: 16px 24px;
        border-radius: 12px;
        font-weight: 600;
        font-size: 14px;
        box-shadow: 0 10px 30px rgba(79, 209, 197, 0.4);
        animation: slideInRight 0.3s ease;
        z-index: 10000;
        border: 1px solid rgba(255, 255, 255, 0.2);
    `;
    notification.textContent = `? ${presetName} Applied`;
    
    document.body.appendChild(notification);
    
    setTimeout(() => {
        notification.style.animation = 'slideOutRight 0.3s ease';
        setTimeout(() => {
            notification.remove();
        }, 300);
    }, 2000);
}
function getPresetName(preset) {
    const names = {
        'low': 'Low Mode',
        'rapid': 'Rapid Boost',
        'lowtexture': 'Low Texture',
        'nogpu': 'No GPU Mode',
        'ultra': 'Ultra Performance',
        'potato': 'Potato Mode',
        'graphics': 'Better Graphics',
        'vignette': 'Vignette Filter',
        'blackwhite': 'Black & White Filter',
        'sepia': 'Sepia Tone Filter',
        'cinematic': 'Cinematic Filter',
        'vibrant': 'Vibrant Filter',
        'reset': 'Settings Reset'
    };
    return names[preset] || 'Preset';
}

document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape') {
        const menu = document.getElementById('fps-menu');
        if (!menu.classList.contains('hidden')) {
            closeMenu();
        }
    }
});

const style = document.createElement('style');
style.textContent = `
    @keyframes slideInRight {
        from {
            transform: translateX(400px);
            opacity: 0;
        }
        to {
            transform: translateX(0);
            opacity: 1;
        }
    }
    
    @keyframes slideOutRight {
        from {
            transform: translateX(0);
            opacity: 1;
        }
        to {
            transform: translateX(400px);
            opacity: 0;
        }
    }
`;
document.head.appendChild(style);
