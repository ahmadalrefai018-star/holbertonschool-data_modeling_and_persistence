CREATE TABLE companies (
    company_id INTEGER PRIMARY KEY,
    company_name TEXT NOT NULL
);

CREATE TABLE attendees (
    attendee_id INTEGER PRIMARY KEY,
    attendee_name TEXT NOT NULL,
    attendee_email TEXT NOT NULL,
    company_id INTEGER,
    FOREIGN KEY (company_id)
        REFERENCES companies(company_id)
);

CREATE TABLE speakers (
    speaker_id INTEGER PRIMARY KEY,
    speaker_name TEXT NOT NULL,
    speaker_email TEXT NOT NULL
);

CREATE TABLE sessions (
    session_id TEXT PRIMARY KEY NOT NULL,
    session_title TEXT NOT NULL,
    track_name TEXT NOT NULL,
    room_name TEXT NOT NULL,
    speaker_id INTEGER NOT NULL,
    FOREIGN KEY (speaker_id)
        REFERENCES speakers(speaker_id)
);

CREATE TABLE registrations (
    attendee_id INTEGER NOT NULL,
    session_id TEXT NOT NULL,
    PRIMARY KEY (attendee_id, session_id),
    FOREIGN KEY (attendee_id)
        REFERENCES attendees(attendee_id),
    FOREIGN KEY (session_id)
        REFERENCES sessions(session_id)
);