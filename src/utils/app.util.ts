const PASSWORD_RULES = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
const PASSWORD_RULES_MESSAGES =
    'Password Minimum eight characters, at least one letter, one number and one special character';

export const REGEX = {
    PASSWORD_RULES,
};

export const MESSAGES = {
    PASSWORD_RULES_MESSAGES,
};
