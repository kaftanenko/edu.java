
create table MODEL_MASTER 
(
 ID NUMBER(15,0) NOT NULL AUTO_INCREMENT
, SOME_DATA_FIELD NUMBER(1,0) 
, CONSTRAINT MASTER_PK PRIMARY KEY (ID)
);

create table MODEL_CHILD 
(
 ID NUMBER(15,0) NOT NULL AUTO_INCREMENT
, MASTER_ID NUMBER(15,0) NOT NULL 
, SOME_DATA_FIELD NUMBER(1,0) 
, CONSTRAINT CHILD_PK PRIMARY KEY (ID)
, CONSTRAINT FK_CHILD_TO_MASTER FOREIGN KEY (MASTER_ID) REFERENCES MODEL_MASTER(ID)
);