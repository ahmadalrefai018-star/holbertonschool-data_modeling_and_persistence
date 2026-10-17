# Conference Registration Normalization

The original table repeats attendee, company, session, and speaker
information for each registration. This causes update, insert,
and delete anomalies.

The new design separates five concepts:

- companies: stores company names independently.
- attendees: stores each attendee once and optionally references a company.
- speakers: stores each speaker's name and email once.
- sessions: stores each session once and references its speaker.
- registrations: connects attendees and sessions.

A separate company table allows a company name to be updated in one
place. Keeping company names as plain text in attendees would be
simpler, but would repeat names and allow inconsistent spelling.

Track and room names remain session attributes because no additional
track or room details are required in this design.

Each session is assumed to have one speaker. An attendee can register
for multiple sessions, but only once per session.

Updating a speaker's email requires one change only.
Sessions can exist before anyone registers.
Deleting a registration does not delete session or speaker information.


## ER Diagram

```mermaid
erDiagram
    companies |o--o{ attendees : employs
    attendees ||--o{ registrations : makes
    sessions ||--o{ registrations : receives
    speakers ||--o{ sessions : presents

    companies {
        INTEGER company_id PK
        TEXT company_name
    }

    attendees {
        INTEGER attendee_id PK
        TEXT attendee_name
        TEXT attendee_email
        INTEGER company_id FK
    }

    speakers {
        INTEGER speaker_id PK
        TEXT speaker_name
        TEXT speaker_email
    }

    sessions {
        TEXT session_id PK
        TEXT session_title
        TEXT track_name
        TEXT room_name
        INTEGER speaker_id FK
    }

    registrations {
        INTEGER attendee_id PK, FK
        TEXT session_id PK, FK
    }
```