// const CONFIG = {
//     csvUrl: 'https://docs.google.com/spreadsheets/d/e/2PACX-1vRcxNAweN0wqaUDefm58ukXk1Za0PaJlVzCsbWljQQRGEf0q40-m1vpjfOExD1KUuCPKuY2ARRrzq5z/pub?output=csv'
// };

import { auth } from "../module/auth.js";

export const authInstance = new auth({
    mail: 'samuel.szoniecky@univ-paris8.fr',
    apiOmk: 'http://localhost/omeka-s/api/',
    ident: 'iF0FtB1maVYlCGq9QpfiwnBiVe80u2kO',
    key: 'YKuLrLZqQpBUQW9IGlQWHWkkdEQQd1W8',
});