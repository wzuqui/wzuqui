function FindProxyForURL(url, host)
{
var proxy0 = "PROXY MTZSVMFCPPRD03.corporate.ad:8080;PROXY MTZSVMFCPPRD04.corporate.ad:8080;PROXY MTZSVMFCPPRD05.corporate.ad:8080;PROXY MTZSVMFCPPRD06.corporate.ad:8080;PROXY MTZSVMFCPPRD07.corporate.ad:8080;PROXY MTZSVMFCPPRD08.corporate.ad:8080;PROXY MTZSVMFCPPRD09.corporate.ad:8080"; 
var proxy1 = "PROXY MTZSVMFCPPRD04.corporate.ad:8080;PROXY MTZSVMFCPPRD05.corporate.ad:8080;PROXY MTZSVMFCPPRD06.corporate.ad:8080;PROXY MTZSVMFCPPRD07.corporate.ad:8080;PROXY MTZSVMFCPPRD08.corporate.ad:8080;PROXY MTZSVMFCPPRD09.corporate.ad:8080;PROXY MTZSVMFCPPRD03.corporate.ad:8080";
var proxy2 = "PROXY MTZSVMFCPPRD05.corporate.ad:8080;PROXY MTZSVMFCPPRD06.corporate.ad:8080;PROXY MTZSVMFCPPRD07.corporate.ad:8080;PROXY MTZSVMFCPPRD08.corporate.ad:8080;PROXY MTZSVMFCPPRD09.corporate.ad:8080;PROXY MTZSVMFCPPRD03.corporate.ad:8080;PROXY MTZSVMFCPPRD04.corporate.ad:8080";
var proxy3 = "PROXY MTZSVMFCPPRD06.corporate.ad:8080;PROXY MTZSVMFCPPRD07.corporate.ad:8080;PROXY MTZSVMFCPPRD08.corporate.ad:8080;PROXY MTZSVMFCPPRD09.corporate.ad:8080;PROXY MTZSVMFCPPRD03.corporate.ad:8080;PROXY MTZSVMFCPPRD04.corporate.ad:8080;PROXY MTZSVMFCPPRD05.corporate.ad:8080";
var proxy4 = "PROXY MTZSVMFCPPRD07.corporate.ad:8080;PROXY MTZSVMFCPPRD08.corporate.ad:8080;PROXY MTZSVMFCPPRD09.corporate.ad:8080;PROXY MTZSVMFCPPRD03.corporate.ad:8080;PROXY MTZSVMFCPPRD04.corporate.ad:8080;PROXY MTZSVMFCPPRD05.corporate.ad:8080;PROXY MTZSVMFCPPRD06.corporate.ad:8080";
var proxy5 = "PROXY MTZSVMFCPPRD08.corporate.ad:8080;PROXY MTZSVMFCPPRD09.corporate.ad:8080;PROXY MTZSVMFCPPRD03.corporate.ad:8080;PROXY MTZSVMFCPPRD04.corporate.ad:8080;PROXY MTZSVMFCPPRD05.corporate.ad:8080;PROXY MTZSVMFCPPRD06.corporate.ad:8080;PROXY MTZSVMFCPPRD07.corporate.ad:8080";
var proxy6 = "PROXY MTZSVMFCPPRD09.corporate.ad:8080;PROXY MTZSVMFCPPRD03.corporate.ad:8080;PROXY MTZSVMFCPPRD04.corporate.ad:8080;PROXY MTZSVMFCPPRD05.corporate.ad:8080;PROXY MTZSVMFCPPRD06.corporate.ad:8080;PROXY MTZSVMFCPPRD07.corporate.ad:8080;PROXY MTZSVMFCPPRD08.corporate.ad:8080";


var regexClassA = /(10)(\.([2][0-4][0-9]|[2][0-5][0-5]|[1][0-9][0-9]|[1-9][0-9]|[0-9])){3}/;
var regexClassB = /(172)\.(1[6-9]|2[0-9]|3[0-1])(\.([2][0-5][0-5]|[1][0-9][0-9]|[1-9][0-9]|[0-9])){2}/;
var regexClassC = /(192)\.(168)(\.([2][0-5][0-5]|[1][0-9][0-9]|[1-9][0-9]|[0-9])){2}/;
var clientip = myIpAddress();
octet = clientip.split(".");
lastoct = octet[3];
modulo = lastoct % 7;

if ( shExpMatch(host,"*www.flora.com.br*") ){
                            if( modulo == 0)              { return proxy0; }
                            else { return proxy1;}
              }

              if ( shExpMatch(host,"*flora.com.br*") ){
                            if (         regexClassA.test(dnsResolve(host)) ||
                                                         regexClassB.test(dnsResolve(host)) ||
                                                         regexClassC.test(dnsResolve(host)) 
                                          )
                                          { return 'DIRECT'; }
                            else if( modulo == 0)      { return proxy2; }
                            else { return proxy1;}
              }
if (
                            /* Don't proxy local domains or local addresses */
                            isPlainHostName(host)                ||
                            /* Don't proxy non-routable addresses (RFC 3330) */
                            regexClassA.test(host) ||
                            regexClassB.test(host) ||
                            regexClassC.test(host) ||
                            shExpMatch(host,"126.1.0.*") ||
                            shExpMatch(host,"127.0.0.*") ||
                            /* Don't proxy local domain */
                            shExpMatch(host,"*.friboi.com.br") ||
                            shExpMatch(host,"*.seara.com.br") ||
                            shExpMatch(host,"vpn.ambarenergia.com.br") ||
                            shExpMatch(host,"*.jbs.agrotools.com.br") ||
                            shExpMatch(host,"*.internetjbs.com.br") ||
                            shExpMatch(host,"*.business.ad") ||
                            shExpMatch(host,"*.organization.ad") ||
                            shExpMatch(host,"*.corporate.ad") ||
                            shExpMatch(host,"*.jbs.com.br") ||
                            shExpMatch(host,"*.jbsfoods.com.br") ||
                            shExpMatch(host,"*.jbsbanco.com.br") ||
                            shExpMatch(host,"*.jbsfriboi.com.br") ||
                            shExpMatch(host,"intranetjbs.com.br") ||
                            shExpMatch(host,"perfil.intranetjbs.com.br") ||							
                            shExpMatch(host,"*.fastedi.com.br") ||
                            shExpMatch(host,"*.semeq.com.br") ||
                            shExpMatch(host,"*.bertin.com.br") ||
                            shExpMatch(host,"*.mediatown.com.br") ||
                            shExpMatch(host,"*.paripassu.com.br") ||
                            shExpMatch(host,"*.mspbrazil.com.br") ||
                            shExpMatch(host,"*.jbsservices.com.br") ||
                            shExpMatch(host,"cmt.caixa.gov.br") ||
                            shExpMatch(host,"www.pge.mt.gov.br") ||
                            shExpMatch(host,"entregador.angellira.com.br") ||
                            shExpMatch(host,"e-processo.receita.fazenda.gov.br") ||
                            shExpMatch(host,"webapp.standard.ad") ||
                            shExpMatch(host,"livroeletronico.fazenda.df.gov.br") ||
                            shExpMatch(host,"outlookjbs.corporate.ad") ||
                            shExpMatch(host,"email.jfinvest.com.br") ||
                            shExpMatch(host,"portal.braskarne.com.br") ||							
                            shExpMatch(host,"*.sistema.ravex.com.br")
                            )
                            { return 'DIRECT'; }
                            
              else if( modulo == 0)     { return proxy0; }
              else if( modulo == 1)     { return proxy1; }
              else if( modulo == 2)     { return proxy2; }
              else if( modulo == 3)     { return proxy3; }
	      else if( modulo == 4)     { return proxy4; }
	      else if( modulo == 5)     { return proxy5; }
              else { return proxy6;}
}
