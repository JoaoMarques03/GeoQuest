create table users (
    user_id SERIAL NOT NULL CONSTRAINT users_pkey PRIMARY KEY,
    username VARCHAR NOT NULL,
    password VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    stride_length DECIMAL (1,2) NOT NULL,
);

-- Add categories users
comment on column users.users_id is 'The user''s id';
comment on column users.username is 'The user''s username';
comment on column users.password is 'The user''s password';
comment on column users.email is 'The user''s email';
comment on column users.stride_length is 'The user''s stride length';

create table quests (
    quest_id SERIAL NOT NULL CONSTRAINT quest_pkey PRIMARY KEY,
    gamemode VARCHAR NOT NULL,
);

-- Add categories quests
comment on column quests.quest_id is 'The quest''s id';
comment on column quests.gamemode is 'The gamemode being played';

create table locations (
    location_id SERIAL NULL CONSTRAINT locations_pkey PRIMARY KEY,
    longitude DECIMAL (2,13) NOT NULL,
    latitude DECIMAL (2,13) NOT NULL,
    name VARCHAR NULL,
);

-- Add categories locations
comment on column locations.location_id is 'The location''s id';
comment on column locations.longitude is 'The locations''s longitude';
comment on column locations.latitude is 'The location''s latitude';
comment on column locations.name is 'The location''s name';

create table photos (
    photo_id SERIAL NOT NULL CONSTRAINT photos_pkey PRIMARY KEY,
    image_url VARCHAR NOT NULL,
    photo_location_id VARCHAR NULL,
);

-- Add categories photos
comment on column photos.photo_id is 'The photo''s id';
comment on column photos.image_url is 'The image''s url';
comment on column photos.photo_location_id is 'The id of the location on the photo';

create table quest_location (
    quest_location_id SERIAL NOT NULL CONSTRAINT quest_location_pkey PRIMARY KEY,
    locations_id REFERENCES locations (location_id) ON UPDATE CASCADE ON DELETE CASCADE,
    quests_id REFERENCES quests (quest_id) ON UPDATE CASCADE ON DELETE CASCADE,
);

-- Add categories quest_location
comment on column quest_location.quest_location_id is 'The id of location in the quest being played';
comment on column quest_location.locations_id is 'The location''s id';
comment on column quest_location.quests_id is 'The quest''s id';

create table user_quest (
    user_quest_id SERIAL NOT NULL CONSTRAINT user_quest_pkey PRIMARY KEY,
    quests_id REFERENCES quests (quest_id) ON UPDATE CASCADE ON DELETE CASCADE,
    users_id REFERENCES users (user_id) ON UPDATE CASCADE ON DELETE CASCADE,
    locations_found integer,
    distance_covered integer,
    score integer,
    steps integer,
);

-- Add categories user_quest
comment on column user_quest.user_quest_id is 'The user''s id associated with the quest''s id';
comment on column user_quest.quests_id is 'The quest''s id';
comment on column user_quest.users_id is 'The user''s id';
comment on column user_quest.locations_found is 'The number of locations found during the quest';
comment on column user_quest.distance_covered is 'The user''s distance covered during the quest';
comment on column user_quest.score is 'The user''s score during the quest';
comment on column user_quest.steps is 'The user''s steps during the quest';


insert into users (username, password) values ('Roberta', '123');
insert into users (username, password) values ('Joao', '123');
insert into locations (location_id, longitude, latitude) values ('Museu do Oriente', '38.7031010386998', '-9.171026243031786');
insert into locations (location_id, longitude, latitude) values ('Museu Nacional de Arte Antiga', '38.70495139178823', '-9.161488308271545');
insert into locations (location_id, longitude, latitude) values ('Jardim 9 de Abril', '38.704444', '-9.162722');
insert into locations (location_id, longitude, latitude) values ('Museu da Marioneta', '38.70810028885371', '-9.155775935408098');
insert into locations (location_id, longitude, latitude) values ('Jardim Lisboa Antiga', '38.711817422588005', '-9.154456254923248');
insert into locations (location_id, longitude, latitude) values ('Time Out Market Lisboa', '38.70722497680704', '-9.145978830266364');
insert into locations (location_id, longitude, latitude) values ('Museu das Comunicações', '38.70792824352956', '-9.15043129703937');
insert into locations (location_id, longitude, latitude) values ('Green Street Lisbon', '38.709267780011', '-9.152416131917786');
insert into locations (location_id, longitude, latitude) values ('Museu da Farmácia', '38.71025985761974', '-9.147164337525124');
insert into locations (location_id, longitude, latitude) values ('Praça Luís de Camões', '38.71074544864401', '-9.143452124801652');
