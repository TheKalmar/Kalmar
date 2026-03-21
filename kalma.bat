@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "REPO=kalmar"

echo.
echo ==========================================
echo   Creating repo scaffold: %REPO%
echo ==========================================
echo.

if exist "%REPO%" (
  echo Folder "%REPO%" already exists.
  echo Delete or rename it, then run again.
  exit /b 1
)

mkdir "%REPO%"
cd /d "%REPO%"

REM =========================
REM ROOT FOLDERS
REM =========================
mkdir docs
mkdir docs\00-overview
mkdir docs\01-business
mkdir docs\02-flows
mkdir docs\03-screens
mkdir docs\04-design
mkdir docs\05-handoff

mkdir spec
mkdir spec\flows
mkdir spec\screens
mkdir spec\ux
mkdir spec\entities
mkdir spec\api

mkdir apps
mkdir apps\payment-checkout
mkdir apps\merchant-dashboard

mkdir services
mkdir services\api

mkdir packages
mkdir packages\shared-contracts
mkdir packages\shared-ui

mkdir templates
mkdir scripts
mkdir .github
mkdir .github\workflows

REM =========================
REM ROOT FILES
REM =========================
(
echo # kalmar
echo.
echo QR-based payment platform repository.
echo.
echo ## Purpose
echo This repository is structured so product, UI/UX, frontend, backend, and AI tools can work from the same source of truth.
echo.
echo ## High-level folder map
echo - docs/ = human-readable product and UX documentation
echo - spec/ = AI-readable structured specs ^(YAML/JSON-style source of truth^)
echo - apps/ = frontend applications
echo - services/ = backend services
echo - packages/ = shared code and contracts
echo - templates/ = standard templates for new flows/screens/specs
echo - scripts/ = automation helpers
echo - .github/ = GitHub workflows and collaboration rules
echo.
echo ## Where each role works
echo.
echo ### Product / You
echo - docs/00-overview
echo - docs/01-business
echo - docs/02-flows
echo - docs/05-handoff
echo.
echo ### UI/UX
echo - docs/03-screens
echo - docs/04-design
echo - docs/05-handoff/figma-links.md
echo - docs/05-handoff/open-questions.md
echo.
echo ### Frontend Dev
echo - apps/
echo - packages/shared-ui
echo - packages/shared-contracts
echo - spec/screens
echo - spec/ux
echo.
echo ### Backend Dev
echo - services/api
echo - spec/api
echo - spec/entities
echo - spec/flows
echo.
echo ## GitHub usage rules
echo 1. main = stable branch
echo 2. create feature branches like:
echo    - feature/qr-payment-flow
echo    - feature/payment-page-ui
echo    - feature/merchant-dashboard
echo 3. never dump random files in repo root
echo 4. one screen = one file in docs/03-screens and spec/screens
echo 5. one flow = one file in docs/02-flows and spec/flows
echo 6. if UI/UX changes a screen, update both:
echo    - docs/03-screens/...md
echo    - spec/screens/...yaml
echo 7. add Figma links only in docs/05-handoff/figma-links.md
echo 8. unresolved design/product questions go in docs/05-handoff/open-questions.md
echo.
echo ## Recommended first workflow
echo 1. Fill docs/00-overview/product-overview.md
echo 2. Fill docs/01-business/personas.md
echo 3. Fill docs/02-flows/*.md
echo 4. Fill docs/03-screens/*.md
echo 5. Share repo with UI/UX designer
echo 6. UI/UX adds Figma links in docs/05-handoff/figma-links.md
echo 7. Devs implement against spec/
echo.
echo ## Commit naming examples
echo - docs: add qr payment flow
echo - ux: define payment page layout
echo - spec: add payment success screen spec
echo - feat: scaffold payment checkout app
echo.
echo ## Branch protection suggestion
echo Protect main and require pull request review before merge.
) > README.md

(
echo node_modules/
echo dist/
echo build/
echo .idea/
echo .vscode/
echo *.log
echo *.tmp
echo Thumbs.db
echo Desktop.ini
echo .DS_Store
) > .gitignore

(
echo # Pull Request Template
echo.
echo ## What changed
echo.
echo ## Why
echo.
echo ## Impacted areas
echo - [ ] docs
echo - [ ] spec
echo - [ ] apps
echo - [ ] services
echo - [ ] packages
echo.
echo ## Checklist
echo - [ ] I updated related docs
echo - [ ] I updated related spec files
echo - [ ] I added open questions if anything is unclear
echo - [ ] I kept naming consistent
) > .github\pull_request_template.md

REM =========================
REM DOCS README
REM =========================
(
echo # Docs
echo.
echo Human-readable documentation lives here.
echo.
echo ## Structure
echo - 00-overview = product context and goals
echo - 01-business = personas and business assumptions
echo - 02-flows = user journeys and edge cases
echo - 03-screens = screen-by-screen UX definitions
echo - 04-design = design principles, tokens, brand direction
echo - 05-handoff = Figma links, checklist, questions, handoff notes
echo.
echo ## Rule
echo Every important flow or screen should have a mirror file in spec/.
) > docs\README.md

REM =========================
REM OVERVIEW FILES
REM =========================
(
echo # Product Overview
echo.
echo ## What is kalmar
echo kalmar is a QR-based payment platform for merchants and customers with focus on speed, trust, and lower payment friction.
echo.
echo ## Core use cases
echo - QR payment
echo - Merchant onboarding
echo - Merchant dashboard
echo.
echo ## MVP scope
echo - Generate payment QR
echo - Public payment page
echo - Payment result states
echo - Merchant dashboard basics
echo.
echo ## Non-goals for v1
echo - Refund management
echo - Loyalty engine
echo - Advanced analytics
) > docs\00-overview\product-overview.md

(
echo # Vision and Goals
echo.
echo ## Vision
echo Build a clean, trusted, low-friction merchant payment experience.
echo.
echo ## Product goals
echo - Minimal steps to payment
echo - Mobile-first UX
echo - Clear merchant value
echo - AI-friendly product documentation
) > docs\00-overview\vision-and-goals.md

(
echo # Glossary
echo.
echo - Merchant = business accepting payments
echo - Customer = person paying
echo - A2A = account-to-account payment
echo - Checkout = public payment page
echo - Payment session = one payment attempt context
) > docs\00-overview\glossary.md

REM =========================
REM BUSINESS FILES
REM =========================
(
echo # Personas
echo.
echo ## Merchant
echo Needs simple setup, clear transaction visibility, and fast payment acceptance.
echo.
echo ## Customer
echo Needs fast payment with minimal effort and high trust.
echo.
echo ## Internal admin
echo Needs visibility into merchants, payments, and operational issues.
) > docs\01-business\personas.md

(
echo # Compliance Notes
echo.
echo Add legal, privacy, KYC, encryption, and bank integration notes here.
echo Keep this non-technical but clear.
) > docs\01-business\compliance-notes.md

REM =========================
REM FLOW FILES
REM =========================
(
echo # Flows
echo.
echo One file per flow.
echo.
echo Naming rule:
echo - docs/02-flows/qr-payment-flow.md
echo - spec/flows/qr-payment.yaml
echo.
echo Update both when flow changes.
) > docs\02-flows\README.md

(
echo # QR Payment Flow
echo.
echo ## Goal
echo Customer scans QR and completes payment with minimal friction.
echo.
echo ## Actor
echo Customer
echo.
echo ## Steps
echo 1. Scan QR
echo 2. Open payment page
echo 3. Review merchant and amount
echo 4. Select payment method
echo 5. Confirm payment
echo 6. Show success or failure result
echo.
echo ## Edge cases
echo - Invalid QR
echo - Session expired
echo - Payment failed
echo - User closes page
echo.
echo ## Notes for UI/UX
echo Keep trust elements visible: merchant name, amount, status clarity.
) > docs\02-flows\qr-payment-flow.md

(
echo # Merchant Onboarding Flow
echo.
echo ## Goal
echo Merchant submits company and bank data and gets ready to receive payments.
echo.
echo ## Actor
echo Merchant
echo.
echo ## Steps
echo 1. Start onboarding
echo 2. Enter company information
echo 3. Enter bank information
echo 4. Review and submit
echo 5. Show onboarding status
echo.
echo ## Edge cases
echo - Missing required fields
echo - Validation failed
echo - Duplicate merchant
) > docs\02-flows\merchant-onboarding-flow.md

REM =========================
REM SCREEN FILES
REM =========================
(
echo # Screens
echo.
echo One screen per file.
echo.
echo Required sections for each screen:
echo - Purpose
echo - Elements
echo - States
echo - UX notes
echo - Open questions
echo.
echo Mirror each file in spec/screens.
) > docs\03-screens\README.md

(
echo # Payment Page
echo.
echo ## Purpose
echo Let customer review payment details and choose how to pay.
echo.
echo ## Key elements
echo - Merchant name
echo - Amount
echo - Payment method options
echo - Primary action button
echo - Trust/help text
echo.
echo ## States
echo - Loading
echo - Ready
echo - Error
echo.
echo ## UX notes
echo - No login required
echo - Must feel trustworthy
echo - Mobile-first
echo.
echo ## Open questions
echo - A2A first or card first?
) > docs\03-screens\payment-page.md

(
echo # Payment Success
echo.
echo ## Purpose
echo Confirm successful payment clearly.
echo.
echo ## Key elements
echo - Success state
echo - Amount
echo - Merchant name
echo - Reference ID
echo - Close/Done action
echo.
echo ## States
echo - Success
echo - Delayed confirmation
) > docs\03-screens\payment-success.md

(
echo # Payment Failed
echo.
echo ## Purpose
echo Explain payment failure and guide next action.
echo.
echo ## Key elements
echo - Failure title
echo - Reason if available
echo - Retry action
echo - Secondary support/help action
echo.
echo ## States
echo - Generic fail
echo - Timeout
echo - Session expired
) > docs\03-screens\payment-failed.md

(
echo # Merchant Dashboard
echo.
echo ## Purpose
echo Give merchant quick visibility into transactions and activity.
echo.
echo ## Key elements
echo - Summary cards
echo - Recent transactions
echo - Status filters
echo - Search
echo - QR/payment actions
echo.
echo ## States
echo - Empty
echo - Loading
echo - Populated
echo - Error
) > docs\03-screens\merchant-dashboard.md

(
echo # Onboarding Company Info
echo.
echo ## Purpose
echo Collect merchant company data needed for onboarding.
echo.
echo ## Key elements
echo - Legal company name
echo - Address
echo - JIB
echo - MBS
echo - Representative
echo - Contact email
echo.
echo ## States
echo - Empty
echo - Validation errors
echo - Saved
) > docs\03-screens\onboarding-company-info.md

REM =========================
REM DESIGN FILES
REM =========================
(
echo # Design Principles
echo.
echo - Trust first
echo - Minimal friction
echo - Clear status communication
echo - Mobile-first layouts
echo - Accessible contrast and readable spacing
) > docs\04-design\design-principles.md

(
echo # Brand Guidelines
echo.
echo ## Working direction
echo - Modern fintech
echo - Clean
echo - Confident
echo - Professional
echo.
echo ## Placeholder tokens
echo - Primary: #0060C3
echo - Background: #FFFFFF
echo - Text: #111111
echo - Font: Inter
) > docs\04-design\brand-guidelines.md

(
echo # Design System
echo.
echo ## Components to define
echo - Buttons
echo - Inputs
echo - Alerts
echo - Status badges
echo - Cards
echo - Tables
echo - Empty states
echo.
echo ## Rule
echo UI/UX should define reusable components before drawing too many one-off screens.
) > docs\04-design\design-system.md

REM =========================
REM HANDOFF FILES
REM =========================
(
echo # UI/UX Handoff Checklist
echo.
echo ## Before handoff
echo - [ ] Product overview filled
echo - [ ] Personas filled
echo - [ ] Main flows filled
echo - [ ] Main screens filled
echo - [ ] Design direction filled
echo.
echo ## During design
echo - [ ] Figma link added
echo - [ ] Open questions captured
echo - [ ] New screen files added if needed
echo - [ ] Matching spec files updated
echo.
echo ## Before dev handoff
echo - [ ] Core screens finalized
echo - [ ] Component patterns defined
echo - [ ] States defined
echo - [ ] Empty/loading/error states included
) > docs\05-handoff\uiux-handoff-checklist.md

(
echo # Figma Links
echo.
echo Add all official Figma links here.
echo.
echo ## Files
echo - Main product design:
echo - Component library:
echo - Prototype:
echo.
echo ## Rule
echo Do not scatter Figma links across random files. Keep them here.
) > docs\05-handoff\figma-links.md

(
echo # Open Questions
echo.
echo Use this file for unresolved product, UX, or technical questions.
echo.
echo ## Template
echo - Question:
echo - Owner:
echo - Context:
echo - Needed by:
echo - Decision:
) > docs\05-handoff\open-questions.md

(
echo # GitHub Repo Usage
echo.
echo ## Main rule
echo This repository is the official collaboration space.
echo.
echo ## Where things go
echo - Business/product context goes in docs/00-overview and docs/01-business
echo - Flow definitions go in docs/02-flows
echo - Screen definitions go in docs/03-screens
echo - Visual principles and design system go in docs/04-design
echo - Handoff assets and questions go in docs/05-handoff
echo - Structured machine-readable specs go in spec/
echo - UI implementation goes in apps/
echo - API/backend work goes in services/
echo - Shared components/contracts go in packages/
echo.
echo ## Branch naming
echo - feature/...
echo - docs/...
echo - ux/...
echo - fix/...
echo.
echo ## Pull request rule
echo Every PR should say:
echo - what changed
echo - why it changed
echo - which files must be reviewed
echo.
echo ## Important repo discipline
echo 1. No final design decisions only in chat or WhatsApp
echo 2. No random docs in repo root
echo 3. No unnamed exports or screenshots without context
echo 4. Every major screen needs both docs and spec entries
echo 5. Keep naming identical across docs, spec, and code
echo.
echo ## Example mapping
echo - docs/03-screens/payment-page.md
echo - spec/screens/payment-page.yaml
echo - apps/payment-checkout/ ^(implementation^)
) > docs\05-handoff\github-usage.md

REM =========================
REM SPEC README
REM =========================
(
echo # Spec
echo.
echo Machine-readable structured specs live here.
echo.
echo ## Goal
echo Enable AI tools and developers to work from precise product definitions.
echo.
echo ## Rule
echo Any important screen or flow described in docs/ should have a matching YAML file here.
) > spec\README.md

REM =========================
REM SPEC PRODUCT
REM =========================
(
echo name: kalmar
echo type: payment_platform
echo.
echo description: QR-based payment platform for merchants and customers.
echo.
echo platforms:
echo   - web
echo   - mobile
echo.
echo mvp_features:
echo   - qr_payment
echo   - merchant_onboarding
echo   - merchant_dashboard
echo.
echo non_goals_v1:
echo   - refunds
echo   - loyalty
echo   - advanced_analytics
) > spec\product.yaml

REM =========================
REM FLOW SPECS
REM =========================
(
echo flow_id: qr-payment
echo actor: customer
echo.
echo steps:
echo   - scan_qr
echo   - open_payment_page
echo   - review_merchant_and_amount
echo   - select_payment_method
echo   - confirm_payment
echo   - show_result
echo.
echo edge_cases:
echo   - invalid_qr
echo   - session_expired
echo   - payment_failed
echo   - user_closed_page
) > spec\flows\qr-payment.yaml

(
echo flow_id: merchant-onboarding
echo actor: merchant
echo.
echo steps:
echo   - start_onboarding
echo   - enter_company_information
echo   - enter_bank_information
echo   - review_submission
echo   - submit
echo   - show_status
echo.
echo edge_cases:
echo   - missing_required_fields
echo   - validation_failed
echo   - duplicate_merchant
) > spec\flows\merchant-onboarding.yaml

REM =========================
REM SCREEN SPECS
REM =========================
(
echo screen_id: payment-page
echo purpose: complete_payment
echo.
echo elements:
echo   - merchant_name
echo   - amount
echo   - payment_methods
echo   - primary_action
echo   - trust_text
echo.
echo states:
echo   - loading
echo   - ready
echo   - error
echo.
echo constraints:
echo   mobile_first: true
echo   login_required: false
echo   trust_visible: true
) > spec\screens\payment-page.yaml

(
echo screen_id: payment-success
echo purpose: confirm_successful_payment
echo.
echo elements:
echo   - success_state
echo   - amount
echo   - merchant_name
echo   - reference_id
echo   - done_action
echo.
echo states:
echo   - success
echo   - delayed_confirmation
) > spec\screens\payment-success.yaml

(
echo screen_id: payment-failed
echo purpose: explain_failure_and_offer_next_action
echo.
echo elements:
echo   - failure_title
echo   - failure_reason
echo   - retry_action
echo   - support_action
echo.
echo states:
echo   - generic_fail
echo   - timeout
echo   - session_expired
) > spec\screens\payment-failed.yaml

(
echo screen_id: merchant-dashboard
echo purpose: merchant_transaction_visibility
echo.
echo elements:
echo   - summary_cards
echo   - recent_transactions
echo   - status_filters
echo   - search
echo   - payment_actions
echo.
echo states:
echo   - empty
echo   - loading
echo   - populated
echo   - error
) > spec\screens\merchant-dashboard.yaml

(
echo screen_id: onboarding-company-info
echo purpose: collect_company_data
echo.
echo elements:
echo   - legal_company_name
echo   - address
echo   - jib
echo   - mbs
echo   - representative
echo   - contact_email
echo.
echo states:
echo   - empty
echo   - validation_errors
echo   - saved
) > spec\screens\onboarding-company-info.yaml

REM =========================
REM UX SPECS
REM =========================
(
echo colors:
echo   primary: "#0060C3"
echo   background: "#FFFFFF"
echo   text: "#111111"
echo.
echo typography:
echo   font_family: Inter
echo.
echo spacing:
echo   scale: 8
echo.
echo principles:
echo   - trust_first
echo   - minimal_friction
echo   - mobile_first
) > spec\ux\design-tokens.yaml

(
echo payment_page:
echo   title: "Pay securely"
echo   primary_action: "Continue"
echo.
echo payment_success:
echo   title: "Payment successful"
echo   action_done: "Done"
echo.
echo payment_failed:
echo   title: "Payment failed"
echo   action_retry: "Try again"
) > spec\ux\copy-texts.yaml

(
echo primary_navigation:
echo   - dashboard
echo   - transactions
echo   - qr
echo   - settings
) > spec\ux\navigation.yaml

REM =========================
REM ENTITY / API PLACEHOLDERS
REM =========================
(
echo entity: Merchant
echo fields:
echo   - id
echo   - legal_name
echo   - jib
echo   - mbs
echo   - representative
echo   - contact_email
) > spec\entities\merchant.yaml

(
echo entity: Payment
echo fields:
echo   - id
echo   - merchant_id
echo   - amount
echo   - status
echo   - payment_method
echo   - reference_id
) > spec\entities\payment.yaml

(
echo endpoint_group: payments
echo endpoints:
echo   - create_payment
echo   - get_payment_status
) > spec\api\payments.yaml

(
echo endpoint_group: merchants
echo endpoints:
echo   - create_merchant
echo   - get_merchant
echo   - update_merchant
) > spec\api\merchants.yaml

REM =========================
REM APP / SERVICE PLACEHOLDERS
REM =========================
(
echo # Payment Checkout App
echo.
echo Public-facing checkout application goes here.
echo.
echo Related docs:
echo - docs/03-screens/payment-page.md
echo - docs/03-screens/payment-success.md
echo - docs/03-screens/payment-failed.md
echo.
echo Related specs:
echo - spec/screens/payment-page.yaml
echo - spec/screens/payment-success.yaml
echo - spec/screens/payment-failed.yaml
) > apps\payment-checkout\README.md

(
echo # Merchant Dashboard App
echo.
echo Merchant-facing dashboard application goes here.
echo.
echo Related docs:
echo - docs/03-screens/merchant-dashboard.md
echo.
echo Related specs:
echo - spec/screens/merchant-dashboard.yaml
) > apps\merchant-dashboard\README.md

(
echo # API Service
echo.
echo Backend API implementation goes here.
echo.
echo Related specs:
echo - spec/api/payments.yaml
echo - spec/api/merchants.yaml
echo - spec/entities/merchant.yaml
echo - spec/entities/payment.yaml
) > services\api\README.md

(
echo # Shared Contracts
echo.
echo Shared request/response contracts and types go here.
) > packages\shared-contracts\README.md

(
echo # Shared UI
echo.
echo Shared reusable UI components go here.
) > packages\shared-ui\README.md

REM =========================
REM TEMPLATES
REM =========================
(
echo # Flow Template
echo.
echo ## Goal
echo.
echo ## Actor
echo.
echo ## Steps
echo 1.
echo 2.
echo 3.
echo.
echo ## Edge cases
echo - 
echo.
echo ## Notes for UI/UX
) > templates\flow-template.md

(
echo # Screen Template
echo.
echo ## Purpose
echo.
echo ## Key elements
echo - 
echo.
echo ## States
echo - loading
echo - empty
echo - error
echo.
echo ## UX notes
echo.
echo ## Open questions
) > templates\screen-template.md

(
echo flow_id:
echo actor:
echo.
echo steps:
echo   - 
echo.
echo edge_cases:
echo   - 
) > templates\flow-template.yaml

(
echo screen_id:
echo purpose:
echo.
echo elements:
echo   - 
echo.
echo states:
echo   - loading
echo   - error
echo.
echo constraints:
echo   mobile_first: true
) > templates\screen-template.yaml

REM =========================
REM SCRIPTS
REM =========================
(
echo @echo off
echo echo Add your validation logic here later.
) > scripts\validate-spec.bat

echo.
echo ==========================================
echo   Repo scaffold created successfully
echo ==========================================
echo.
echo Next steps:
echo 1. Open %REPO% in VS Code
echo 2. Run: git init
echo 3. Run: git add .
echo 4. Run: git commit -m "initial kalmar handoff scaffold"
echo 5. Create GitHub repo and push
echo.
echo Most important files to fill first:
echo - README.md
echo - docs\00-overview\product-overview.md
echo - docs\01-business\personas.md
echo - docs\02-flows\qr-payment-flow.md
echo - docs\03-screens\payment-page.md
echo - docs\05-handoff\github-usage.md
echo - docs\05-handoff\figma-links.md
echo.
pause
endlocal