/*WORKFLOW_TEMPLATES*/
CREATE TABLE MSC_WORKFLOW_TEMPLATES(
       WORKFLOW_TEMPLATE_UUID CHAR(36) NOT NULL PRIMARY KEY,
       WORKFLOW_NAME NVARCHAR2(400) NOT NULL,
       WORKFLOW_TEMPLATE_VERSION NUMBER(10) DEFAULT (1) NOT NULL,
       WORKFLOW_TEMPLATE_URI VARCHAR2(255) NOT NULL,
       CREATED_ON DATE NOT NULL,
       IS_ENABLE NUMBER(1) DEFAULT(1) NOT NULL
);


CREATE TABLE MSC_ACTION(
       ACTION_ID CHAR(36) NOT NULL PRIMARY KEY,
       ACTIVITY_INSTANCE_ID CHAR(36) NOT NULL,
       OPERATION_CODE VARCHAR2(50) NOT NULL,
       REQUIRED_ROLE VARCHAR2(50) NOT NULL,
       REQUIRED_OPERATOR_TYPE NUMBER(10) NOT NULL,
       CREATED_ON DATE NOT NULL,
       LAST_UPDATED_ON DATE NOT NULL,
       APPROVER_REQUIRED VARCHAR2(50),
       STATUS NUMBER(10) NOT NULL
);

CREATE TABLE MSC_WORKFLOW_INSTANCE(
       WORKFLOW_INSTANCE_ID CHAR(36) NOT NULL PRIMARY KEY,
       WORKFLOW_TEMPLATE_ID CHAR(36) NOT NULL,
       FORM_TYPE VARCHAR2(50) NOT NULL,
       FORM_ID VARCHAR2(50) NOT NULL,
       OWNER_ID CHAR(36) NOT NULL,
       CREATED_ON DATE NOT NULL,
       LAST_UPDATED_ON DATE NOT NULL,
       INSTANCE_VERSION TIMESTAMP(6) NOT NULL,
       STATUS NUMBER(10) NOT NULL
);

CREATE TABLE MSC_ACTIVITY_INSTANCE(
       ACTIVITY_INSTANCE_ID CHAR(36) NOT NULL PRIMARY KEY,
       WORKFLOW_INSTANCE_ID CHAR(36) NOT NULL,
       ACTIVITY_TEMPLATE_ID VARCHAR2(50) NOT NULL,
       POLICY_DESCRIPTOR VARCHAR(400),
       CREATED_ON DATE NOT NULL,
       LAST_UPDATED_ON DATE NOT NULL,
       STATUS NUMBER(10) NOT NULL
);

CREATE TABLE MSC_WORKFLOW_AUDIT(
       AUDIT_ID CHAR(36) NOT NULL PRIMARY KEY,
       ACTION_ID CHAR(36) NOT NULL,
       OPERATOR_ID CHAR(36) NOT NULL,
       IS_DELEGATED NUMBER(1) NOT NULL,
       OPERATOR_COMMENT VARCHAR2(400),
       CREATED_ON DATE NOT NULL
);

CREATE TABLE MSC_WORKFLOW_BOOKMARK(
       BOOKMARK_ID CHAR(36) NOT NULL PRIMARY KEY,
       WORKFLOW_INSTANCE_ID CHAR(36) NOT NULL,
       FORM_TYPE VARCHAR2(50) NOT NULL,
       FORM_ID CHAR(36) NOT NULL,
       USER_ID CHAR(36) NOT NULL,
       CURRENT_ACTIVITY_NAME NVARCHAR2(400) NOT NULL,
       NEXT_ACTIVITY_NAME NVARCHAR2(400) NOT NULL,
       CREATED_ON DATE NOT NULL,
       LAST_UPDATED_ON DATE NOT NULL,
       ALLOWED_OPERATIONS VARCHAR2(400) NOT NULL
);