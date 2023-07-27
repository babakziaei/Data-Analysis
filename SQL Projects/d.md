+---------------------------------+
|   Django App: Risk Management   |
+---------------------------------+
         |           |      
  +---------------+  +------------------------+
  | Risk          |  | Risk Name              |
  +---------------+  +------------------------+
  | - category    |  | - name                 |
  | - potential   |  | - risk_type            |
  |   responses   |  | - category             |
  | - risk_cause  |  | - created_at           |
  | - risk_effect |  +------------------------+
  | - risk_id     |
  | - risk_identified_by |
  | - created_at  |
  | - risk_type   |
  | - risk_name   |
  +---------------+
         |
  +----------------------------------+
  | Qualitative Risk Analysis        |
  +----------------------------------+
  | - probability                   |
  | - impact                        |
  | - rating                        |
  | - owner                         |
  | - risk (OneToOneField to Risk)  |
  | - urgency                       |
  +----------------------------------+
