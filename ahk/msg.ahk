::ht::Hi Tushar
::hs::Hi Sai
::ha::Hi Aditya
::hv::Hi Vaibhav
;::wc::When can we connect for
::cr::, call regarding 
:*:cro::call for review of ?{left 1} 
::sv::Sent on VDI teams.
::hm::Hi Maya
::hd::Hi Della
::har:: Hi Arindam
:*:ss::$${left 1} 
:*:ff::f(){left 1} 
:*:gg::g(){left 1} 
:*:dd::"my description" 
; :c*:ee::eDocumentId {{}

; :*:]d::  ; This hotstring replaces "]d" with the current date and time via the statement below.
; {
;     Send A_Now  ; It will look like 9/1/2005 3:53 PM
; }

:*:qq::  ; This hotstring replaces "]d" with the current date and time via the statement below.
{
    Send "Sample" . FormatTime(, "h_mm_ss")  ; It will look like 9/1/2005 3:53 PM
}

 ;   Send FormatTime(, "M/d/yyyy h:mm tt")  ; It will look like 9/1/2005 3:53 PM

:*:]d::As a user I should be able to
:*:sic::Shall I call?
:*:cyp::Can you please share
::]a::
(

- Development team should be able to  
- There should be no sonar issues. 
- Add proper logs. 
- Add JUnit test cases with proper code coverage. 

)




::]sbd::mkdir controller config service util\constant model persistence\entity persistence\repo


::]prr::I have raised the PR. Here is the link  
::]prr::I have raised the PR. Here is the PR #  

::]rmc::I have resolved the merge conflict.
::]prm::Can you please merge this.
::]cm::Code is merged into main branch.
::]cdd::Code is deployed on DEV. Working fine
::]cdq::Code is deployed on QA. Working fine
::]cddq::Code is deployed on DEV,QA. Working fine
::]td::Tested on dev. Working fine.
:*:]enh::enhancements

::]gm::Good morning!
::]ga::Good afternoon!
::]ge::Good evening!



:*:iia::It is about
:*:]sc::--spring.config.location=C:/Users/c282465/Desktop/config/


::]kp::netstat -ano | findstr 8080`ntaskkill /F /PID 


::]emailpto::
(

Hello Sai,

I would like to request 2 day off on 19/May and 22/May for personal reasons. I have completed all of my current tasks and will ensure that any important work is covered before I leave. If there are any additional tasks that you need me to complete before or after my absence, please let me know.

I have updated PTO tracker as well.

Regards,
Saksham Sangal

)





::44::
(

delete from pagero_company ;
delete from onboarded_legal_entity_address ;
delete from onboarded_legal_entity_identifiers ;
delete from onboarded_legal_entity ;

)

; delete from process_document_ar_history ;
; delete from process_document_ar_possible_action ;
; delete from process_document_ar_party ;
; delete from business_res_ar ;
; delete from business_res_ar_reason_code ;
; delete from ar_documents ;
; delete from process_document_ar ;
::55::{
	SendInput "delete from process_document_ap_history`;{enter}"
	Sleep 20
	SendInput "delete from ap_documents`;{enter}"
	Sleep 20
	SendInput "delete from process_document_ap`;{enter}"
}
