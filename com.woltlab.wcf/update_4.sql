ALTER TABLE wcf1_user_notification ADD KEY (confirmTime);

DELETE FROM wcf1_user_profile_visitor WHERE userID IS NULL OR ownerID IS NULL;
ALTER TABLE wcf1_user_profile_visitor CHANGE ownerID ownerID INT(10) NOT NULL;
ALTER TABLE wcf1_user_profile_visitor CHANGE userID userID INT(10) NOT NULL;

ALTER TABLE wcf1_user_storage ADD KEY (field);
