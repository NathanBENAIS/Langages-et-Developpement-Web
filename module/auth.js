import {omk} from './omk.js';
export class auth {
    constructor(params) {
        var me = this;
        this.modal;
        this.m;
        this.navbar = params.navbar ? params.navbar : false;
        this.apiOmk = params.apiOmk ? params.apiOmk : false; 
        this.mail = params.mail ? params.mail : false;
        this.ident = params.ident ? params.ident : false;
        this.key = params.key ? params.key : false;
        this.gCLIENT_ID = params.gCLIENT_ID ? params.gCLIENT_ID : false;
        this.gAPI_KEY = params.gAPI_KEY ? params.gAPI_KEY : false;
        this.gDISCOVERY_DOC = params.gDISCOVERY_DOC ? params.gDISCOVERY_DOC : false;
        this.gSCOPES = params.gSCOPES ? params.gSCOPES : false;
        this.fctAuthOK = params.fctAuthOK ? params.fctAuthOK : [];

        this.omk = false;
        this.userAdmin = false;
        this.user = false;
        this.initialized = false;
        
        var iconIn='<i class="fas fa-sign-in-alt"></i>', 
            iconOut='<i class="fa-solid fa-right-from-bracket"></i>',
            btnLogin, nameLogin, alertAuth, alertMail, alertServer, alertUnknown, 
            gisInited, gapiInited, tokenClient;
                
        this.init = async function () {
            this.initialize = async function() {
                this.apiOmk = params.apiOmk ? params.apiOmk : false;
                this.mail = params.mail ? params.mail : false;
                this.ident = params.ident ? params.ident : false;
                this.key = params.key ? params.key : false;
    
                try {
                    if(this.apiOmk) {
                        this.apiOmk += this.apiOmk.slice(-1)=='/' ? "" : "/";
                        // Réinitialiser l'objet omk avec les nouveaux paramètres
                        this.omk = new omk({
                            'api': this.apiOmk,
                            'key': this.key,
                            'ident': this.ident,
                            'mail': this.mail,
                            'vocabs': ["dcterms", "bc"]
                        });
    
                        // Attendre le chargement des propriétés
                        await new Promise(resolve => setTimeout(resolve, 2000));
    
                        // Charger les propriétés explicitement
                        for (const vocab of ["dcterms", "bc"]) {
                            await this.omk.getProps(vocab);
                        }
                        
                        this.initialized = true;
                        return true;
                    }
                    return false;
                } catch (error) {
                    console.error("Erreur d'initialisation:", error);
                    throw error;
                }
            };
    
            // Ajouter une méthode de déconnexion explicite
            this.logout = function() {
                this.mail = "";
                this.ident = "";
                this.key = "";
                this.apiOmk = "";
                this.user = false;
                this.initialized = false;
                this.keyOpenai = "";
                this.orgaOpenai = "";
                this.omk = null;
            };
    
            // Modifier la méthode getUser pour réinitialiser si nécessaire
            this.getUser = async function(cb) {
                try {
                    this.apiOmk = this.apiOmk || (this.m?.select("#authServer").node()?.value || "");
                    this.mail = this.mail || (this.m?.select("#authMail").node()?.value || "");
                    this.ident = this.ident || (this.m?.select("#authIdent").node()?.value || "");
                    this.key = this.key || (this.m?.select("#authPwd").node()?.value || "");
    
                    if (!this.mail || !this.ident || !this.key) {
                        if(cb) cb(false);
                        return false;
                    }
    
                    // Réinitialiser l'authentification si nécessaire
                    if (!this.initialized || !this.omk) {
                        await this.initialize();
                    }
    
                    const query = `property[0][property]=bc:email&property[0][type]=eq&property[0][text]=${encodeURIComponent(this.mail)}`;
                    const response = await this.searchItems(query);
    
                    if (!response || response.length === 0) {
                        if(alertMail) alertMail.show();
                        this.user = false;
                        return cb ? cb(false) : false;
                    }
    
                    this.user = response[0];
                    this.userAdmin = this.user["o:role"] == 'global_admin';
                    
                    if(nameLogin) nameLogin.html(this.user['o:name']);
                    if(btnLogin) btnLogin.attr('class', 'btn btn-danger').html(iconOut);
                    
                    this.user.id = this.user['o:id'];
                    
                    if(this.modal) this.modal.hide();
                    
                    this.fctAuthOK.forEach(fct => {
                        if(fct.name == 'loadParcours') fct();
                    });
    
                    return cb ? cb(this.user) : this.user;
                } catch (error) {
                    console.error("Error in getUser:", error);
                    return cb ? cb(false) : false;
                }
            };
                                                                               
        }

        async function initializeGapiClient() {
            await gapi.client.init({
                apiKey: me.gAPI_KEY,
                discoveryDocs: [me.gDISCOVERY_DOC],
            });
            gapiInited = true;
            showBtnAuth();
            handleAuthClick();
        }

        function showBtnAuth() {
            document.getElementById('btnAuth').style.visibility = 'visible';
        }

        function handleAuthClick() {
            tokenClient.callback = async (resp) => {
                if (resp.error !== undefined) {
                    throw (resp);
                }
                d3.select('#btnAuth').html('<i class="fa-solid fa-arrows-rotate"></i>');
                me.fctAuthOK.forEach(fct => {
                    if(fct.name=='loadCalendars')fct(tokenClient);            
                });
            };

            if (gapi.client.getToken() === null) {
                tokenClient.requestAccessToken({prompt: 'consent'});
            } else {
                tokenClient.requestAccessToken({prompt: ''});
            }
        }

        function createNavBar() {
            //création des éléments html
            let htmlNavBar = `<div class="btn-group">
            <div id="userLogin" class="me-2">Anonymous</div>                                        
            <button id="btnAddUser" style="visibility:hidden;" title="Add user" class="btn btn-outline-danger" >
                <i class="fa-solid fa-user-plus"></i>
            </button>
            <button id="btnLogin" title="Connexion" class="btn btn-outline-success">${iconIn}</button>
        </div>`;
        me.navbar.append('li').attr('class', "nav-item ms-2 me-1").html(htmlNavBar);
            let htmlModal = `
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<h5 class="modal-title">Authentication</h5>
<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<div class="modal-body">

    <div class="input-group mb-3">
    <span class="input-group-text" id="serverIcon"><i class="fa-solid fa-server"></i></span>
    <input id="authServer" type="text" class="form-control" placeholder="Server" aria-label="Email" aria-describedby="serverIcon">
    </div>

    <div class="input-group mb-3">
    <span class="input-group-text" id="mailIcon"><i class="fa-solid fa-at"></i></span>
    <input id="authMail" type="text" class="form-control" placeholder="Email" aria-label="Email" aria-describedby="mailIcon">
    </div>

    <div class="input-group mb-3">
    <span class="input-group-text" id="identIcon"><i class="fa-solid fa-fingerprint"></i></i></span>
    <input id="authIdent" type="password" class="form-control" placeholder="Identity" aria-describedby="identIcon">
    </div>
    

    <div class="input-group mb-3">
    <span class="input-group-text" id="mdpIcon"><i class="fa-solid fa-key"></i></span>
    <input id="authPwd" type="password" class="form-control" placeholder="Key" aria-describedby="mdpIcon">
    </div>

    <div class="input-group mb-3">
    <span class="input-group-text" id="mdpOpenai">
    <svg data-name="OpenAI Logo" width="24px" height="24px" viewBox="140 140 520 520"><defs><linearGradient id="linear" x1="100%" y1="22%" x2="0%" y2="78%"><stop offset="0%" stop-color="rgb(131,211,231)"></stop><stop offset="2%" stop-color="rgb(127,203,229)"></stop><stop offset="25%" stop-color="rgb(86,115,217)"></stop><stop offset="49%" stop-color="rgb(105,80,190)"></stop><stop offset="98%" stop-color="rgb(197,59,119)"></stop><stop offset="100%" stop-color="rgb(197,59,119)"></stop></linearGradient></defs><path id="logo" d="m617.24 354a126.36 126.36 0 0 0 -10.86-103.79 127.8 127.8 0 0 0 -137.65-61.32 126.36 126.36 0 0 0 -95.31-42.49 127.81 127.81 0 0 0 -121.92 88.49 126.4 126.4 0 0 0 -84.5 61.3 127.82 127.82 0 0 0 15.72 149.86 126.36 126.36 0 0 0 10.86 103.79 127.81 127.81 0 0 0 137.65 61.32 126.36 126.36 0 0 0 95.31 42.49 127.81 127.81 0 0 0 121.96-88.54 126.4 126.4 0 0 0 84.5-61.3 127.82 127.82 0 0 0 -15.76-149.81zm-190.66 266.49a94.79 94.79 0 0 1 -60.85-22c.77-.42 2.12-1.16 3-1.7l101-58.34a16.42 16.42 0 0 0 8.3-14.37v-142.39l42.69 24.65a1.52 1.52 0 0 1 .83 1.17v117.92a95.18 95.18 0 0 1 -94.97 95.06zm-204.24-87.23a94.74 94.74 0 0 1 -11.34-63.7c.75.45 2.06 1.25 3 1.79l101 58.34a16.44 16.44 0 0 0 16.59 0l123.31-71.2v49.3a1.53 1.53 0 0 1 -.61 1.31l-102.1 58.95a95.16 95.16 0 0 1 -129.85-34.79zm-26.57-220.49a94.71 94.71 0 0 1 49.48-41.68c0 .87-.05 2.41-.05 3.48v116.68a16.41 16.41 0 0 0 8.29 14.36l123.31 71.19-42.69 24.65a1.53 1.53 0 0 1 -1.44.13l-102.11-59a95.16 95.16 0 0 1 -34.79-129.81zm350.74 81.62-123.31-71.2 42.69-24.64a1.53 1.53 0 0 1 1.44-.13l102.11 58.95a95.08 95.08 0 0 1 -14.69 171.55c0-.88 0-2.42 0-3.49v-116.68a16.4 16.4 0 0 0 -8.24-14.36zm42.49-63.95c-.75-.46-2.06-1.25-3-1.79l-101-58.34a16.46 16.46 0 0 0 -16.59 0l-123.31 71.2v-49.3a1.53 1.53 0 0 1 .61-1.31l102.1-58.9a95.07 95.07 0 0 1 141.19 98.44zm-267.11 87.87-42.7-24.65a1.52 1.52 0 0 1 -.83-1.17v-117.92a95.07 95.07 0 0 1 155.9-73c-.77.42-2.11 1.16-3 1.7l-101 58.34a16.41 16.41 0 0 0 -8.3 14.36zm23.19-50 54.92-31.72 54.92 31.7v63.42l-54.92 31.7-54.92-31.7z" fill="#202123"></path></svg>
    <i style="margin-left:3px;" class="fa-solid fa-key"></i>
    </span>
    <input id="authOpenaiKey" type="password" class="form-control" placeholder="OpenAi Key" aria-describedby="keyOpenai">
    </div>

    <div class="input-group mb-3">
    <span class="input-group-text" id="orgaOpenai">
    <svg data-name="OpenAI Logo" width="24px" height="24px" viewBox="140 140 520 520"><defs><linearGradient id="linear" x1="100%" y1="22%" x2="0%" y2="78%"><stop offset="0%" stop-color="rgb(131,211,231)"></stop><stop offset="2%" stop-color="rgb(127,203,229)"></stop><stop offset="25%" stop-color="rgb(86,115,217)"></stop><stop offset="49%" stop-color="rgb(105,80,190)"></stop><stop offset="98%" stop-color="rgb(197,59,119)"></stop><stop offset="100%" stop-color="rgb(197,59,119)"></stop></linearGradient></defs><path id="logo" d="m617.24 354a126.36 126.36 0 0 0 -10.86-103.79 127.8 127.8 0 0 0 -137.65-61.32 126.36 126.36 0 0 0 -95.31-42.49 127.81 127.81 0 0 0 -121.92 88.49 126.4 126.4 0 0 0 -84.5 61.3 127.82 127.82 0 0 0 15.72 149.86 126.36 126.36 0 0 0 10.86 103.79 127.81 127.81 0 0 0 137.65 61.32 126.36 126.36 0 0 0 95.31 42.49 127.81 127.81 0 0 0 121.96-88.54 126.4 126.4 0 0 0 84.5-61.3 127.82 127.82 0 0 0 -15.76-149.81zm-190.66 266.49a94.79 94.79 0 0 1 -60.85-22c.77-.42 2.12-1.16 3-1.7l101-58.34a16.42 16.42 0 0 0 8.3-14.37v-142.39l42.69 24.65a1.52 1.52 0 0 1 .83 1.17v117.92a95.18 95.18 0 0 1 -94.97 95.06zm-204.24-87.23a94.74 94.74 0 0 1 -11.34-63.7c.75.45 2.06 1.25 3 1.79l101 58.34a16.44 16.44 0 0 0 16.59 0l123.31-71.2v49.3a1.53 1.53 0 0 1 -.61 1.31l-102.1 58.95a95.16 95.16 0 0 1 -129.85-34.79zm-26.57-220.49a94.71 94.71 0 0 1 49.48-41.68c0 .87-.05 2.41-.05 3.48v116.68a16.41 16.41 0 0 0 8.29 14.36l123.31 71.19-42.69 24.65a1.53 1.53 0 0 1 -1.44.13l-102.11-59a95.16 95.16 0 0 1 -34.79-129.81zm350.74 81.62-123.31-71.2 42.69-24.64a1.53 1.53 0 0 1 1.44-.13l102.11 58.95a95.08 95.08 0 0 1 -14.69 171.55c0-.88 0-2.42 0-3.49v-116.68a16.4 16.4 0 0 0 -8.24-14.36zm42.49-63.95c-.75-.46-2.06-1.25-3-1.79l-101-58.34a16.46 16.46 0 0 0 -16.59 0l-123.31 71.2v-49.3a1.53 1.53 0 0 1 .61-1.31l102.1-58.9a95.07 95.07 0 0 1 141.19 98.44zm-267.11 87.87-42.7-24.65a1.52 1.52 0 0 1 -.83-1.17v-117.92a95.07 95.07 0 0 1 155.9-73c-.77.42-2.11 1.16-3 1.7l-101 58.34a16.41 16.41 0 0 0 -8.3 14.36zm23.19-50 54.92-31.72 54.92 31.7v63.42l-54.92 31.7-54.92-31.7z" fill="#202123"></path></svg>
    <i style="margin-left:3px;" class="fa-solid fa-suitcase"></i>
    </span>
    <input id="authOpenaiOrga" type="password" class="form-control" placeholder="OpenAi Organisation Id" aria-describedby="orgaOpenai">
    </div>
    

    <div class="collapse" id="alertAuth">
        <div  class="alert alert-danger d-flex align-items-center" role="alert">
            <i class="fa-solid fa-triangle-exclamation"></i>
            <div id='errorMessage' class='mx-1'>
            identity or credential are wrong !
            </div>
        </div>
    </div>

    <div class="collapse" id="alertMail">
        <div  class="alert alert-warning d-flex align-items-center" role="alert">
            <i class="fa-solid fa-triangle-exclamation"></i>
            <div id='errorMessage' class='mx-1'>
            The user does not exist !
            </div>
        </div>
    </div>

    <div class="collapse" id="alertServer">
        <div  class="alert alert-warning d-flex align-items-center" role="alert">
            <i class="fa-solid fa-triangle-exclamation"></i>
            <div id='errorMessage' class='mx-1'>
            Server does not exist !
            </div>
        </div>
    </div>

    <div class="collapse" id="alertUnknown">
        <div  class="alert alert-warning d-flex align-items-center" role="alert">
            <i class="fa-solid fa-triangle-exclamation"></i>
            <div id='errorMessage' class='mx-1'>
            This user is unknown.
            Please contact the administrator.                                
            </div>
        </div>
    </div>    

</div>                          
<div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
    <button id='btnCheck' style="visibility:visible;" type="button" class="btn btn-primary">Check</button>
</div>
</div>
</div>
`;
            me.m = d3.select('body').append('div')
                .attr('id', 'modalAuth').attr('class', 'modal').attr('tabindex', -1);
            me.m.html(htmlModal);
            me.modal = new bootstrap.Modal('#modalAuth');
            alertAuth = new bootstrap.Collapse('#alertAuth', {
                toggle: false
            });
            alertMail = new bootstrap.Collapse('#alertMail', {
                toggle: false
            });
            alertServer = new bootstrap.Collapse('#alertServer', {
                toggle: false
            });
            alertUnknown = new bootstrap.Collapse('#alertUnknown', {
                toggle: false
            });
            alertAuth.hide();
            alertMail.hide();
            alertServer.hide();
            alertUnknown.hide();
            //gestion des événements
            me.m.selectAll("input").on('change', e => {
                alertAuth.hide();
                alertMail.hide();
                alertServer.hide();
                alertUnknown.hide();
                me.mail = "";
                me.ident = "";
                me.key = "";
                me.apiOmk = "";
                me.user = false;
                me.keyOpenai = "";
                me.orgaOpenai = "";
            });
            nameLogin = me.navbar.select("#userLogin");
            btnLogin = me.navbar.select("#btnLogin");
            btnLogin.on('click', e => {
                if (btnLogin.attr('class') == 'btn btn-outline-success') me.modal.show();
                else {
                    me.mail = "";
                    me.ident = "";
                    me.key = "";
                    me.apiOmk = "";
                    me.user = false;
                    me.keyOpenai = "";
                    me.orgaOpenai = "";
                    nameLogin.html('Anonymous');
                    btnLogin.attr('class', 'btn btn-outline-success');
                }
            });
            me.m.select("#btnCheck").on('click', e => {
                me.getUser(null);
            });
        }

        this.getUser = async function (cb) {
            try {
                if(!me.mail || !me.ident || !me.key){
                    if(cb) cb(me.user);
                    return;
                }

                if(!me.omk) {
                    me.omk = new omk({
                        'api': me.apiOmk,
                        'key': me.key,
                        'ident': me.ident,
                        'mail': me.mail
                    });
                }

                const query = `property[0][property]=bc:email&property[0][type]=eq&property[0][text]=${encodeURIComponent(me.mail)}`;
                const response = await me.searchItems(query);

                if(!response || response.length === 0){
                    if(alertMail) alertMail.show();
                    me.user = false;
                    me.omk = false;                                                                     
                } else {
                    me.user = response[0];
                    me.userAdmin = me.user["o:role"] == 'global_admin';            
                    if(nameLogin) nameLogin.html(me.user['o:name']);
                    if(btnLogin) btnLogin.attr('class','btn btn-danger').html(iconOut);                        
                    me.user.id = me.user['o:id'];
                    if(me.modal) me.modal.hide();
                    me.fctAuthOK.forEach(fct => {
                        if(fct.name=='loadParcours') fct();            
                    });
                }

                if(cb) cb(me.user);
                return me.user;

            } catch (error) {
                console.error("Error getting user:", error);
                if(cb) cb(false);
                return false;
            }
        }

        // Nouvelles méthodes ajoutées

        this.searchItems = async function(query) {
            if (!this.omk) {
                throw new Error('OMK non initialisé');
            }
            try {
                return await this.omk.searchItems(query);
            } catch (error) {
                console.error("Error searching items:", error);
                throw error;
            }
        }

        this.isInitialized = function() {
            return this.initialized && this.omk && this.omk.props && this.omk.props.length > 0;
        }

        this.waitForInitialization = async function() {
            let attempts = 0;
            const maxAttempts = 10;
            
            while (attempts < maxAttempts) {
                if (this.isInitialized()) {
                    return true;
                }
                await new Promise(resolve => setTimeout(resolve, 1000));
                attempts++;
            }
            
            throw new Error("Timeout waiting for initialization");
        }

        this.getPropertyValue = function(item, property) {
            return item[property] && item[property][0] ? item[property][0]['@value'] : '';
        }

        // Démarrer l'initialisation
        this.init().catch(error => {
            console.error("Failed to initialize auth:", error);
        });
    }
}