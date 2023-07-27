Certainly! GitHub READMEs utilize Markdown, a lightweight and easy-to-use syntax for styling all forms of writing on the GitHub platform. Here's how you might include the ASCII art diagram in a Markdown-formatted GitHub README:

```markdown
# Risk Analysis Django Application

This application is built on Django, and it provides tools for conducting both qualitative and quantitative risk analysis. The app is structured around two main Django apps: `Risk Management` and `Qualitative Risk Analysis`.

## Project Structure

Below is a simplified representation of the Django models and their relationships used in this project:

```
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
```

In the diagram above, the arrows (`|`) denote relationships between the Django models. The `Risk Management` app contains two models: `Risk` and `Risk Name`. The `Risk` model has a `OneToOneField` relationship to the `Qualitative Risk Analysis` model, which is part of the `Qualitative Risk Analysis` app. This means that each risk (as identified in the `Risk Management` app) has a corresponding qualitative risk analysis.
```

Feel free to modify this text to better suit your project's needs.
