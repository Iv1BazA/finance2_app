class Question {
  final String text;
  final List<String> answers;
  final String correctAnswer;

  Question({
    required this.text,
    required this.answers,
    required this.correctAnswer,
  });
}

final List<Question> questions = [
  Question(
    text: 'What is APR in the context of credit cards and loans?',
    answers: [
      'Annual Percentage Rate',
      'Automatic Payment Recognition',
      'Annual Amortization Rate'
    ],
    correctAnswer: 'Annual Percentage Rate',
  ),
  Question(
    text:
        'What is the process of assessing the value of an asset or property called?',
    answers: [
      'Shareholder Assessment',
      'Market Valuation',
      'Active Management'
    ],
    correctAnswer: 'Market Valuation',
  ),
  Question(
    text: 'What is ETF?',
    answers: [
      'One-time Trading Fund',
      'Exchange-Traded Fund',
      'Economic Tariff Fund'
    ],
    correctAnswer: 'Exchange-Traded Fund',
  ),
  Question(
    text: 'What is the difference between stocks and bonds?',
    answers: [
      'Bonds represent ownership in a company, and stocks represent a promise to return money.',
      'Stocks represent ownership in a company, and bonds represent a company\'s debt obligation.',
      'Bonds and stocks are the same thing.'
    ],
    correctAnswer:
        'Stocks represent ownership in a company, and bonds represent a company\'s debt obligation.',
  ),
  Question(
    text: 'What is an IRA?',
    answers: [
      'Individual Reserve Account',
      'Individual Stock Growth',
      'Individual Retirement Account'
    ],
    correctAnswer: 'Individual Retirement Account',
  ),
  Question(
    text: 'What factors affect a person\'s credit score?',
    answers: [
      'Monthly income amount and eye color.',
      'Payment history and debt level.',
      'Love for cats and the number of friends on social media.'
    ],
    correctAnswer: 'Payment history and debt level.',
  ),
  Question(
    text: 'What is cash flow, and why is it important for financial planning?',
    answers: [
      'It\'s the cash flowing into a bank account, important for loan repayment.',
      'It\'s a company\'s profit, important for stock growth.',
      'It\'s the flow of cash into and out of a business or personal finances, important for evaluating financial health and decision-making.'
    ],
    correctAnswer:
        'It\'s the flow of cash into and out of a business or personal finances, important for evaluating financial health and decision-making.',
  ),
  Question(
    text: 'What is compound interest?',
    answers: [
      'Interest paid by the bank each year.',
      'Interest accrued only on the principal amount.',
      'Interest earned on the initial deposit and the interest already earned on it.'
    ],
    correctAnswer:
        'Interest earned on the initial deposit and the interest already earned on it.',
  ),
  Question(
    text: 'What types of insurance are typically included in auto insurance?',
    answers: [
      'Life insurance and unemployment insurance.',
      'Home insurance and health insurance.',
      'Damage insurance and injury insurance.'
    ],
    correctAnswer: 'Damage insurance and injury insurance.',
  ),
  Question(
    text:
        'What is an investment portfolio, and why is it important for risk diversification?',
    answers: [
      'It\'s a collection of funds gathered for investment in a single asset.',
      'It\'s a combination of various assets such as stocks, bonds, real estate, and others, important for reducing investment risk.',
      'It\'s a strategy of investing only in one type of asset for maximizing profit.'
    ],
    correctAnswer:
        'It\'s a combination of various assets such as stocks, bonds, real estate, and others, important for reducing investment risk.',
  ),
  Question(
    text: 'What documents are required for filing a tax return in the USA?',
    answers: [
      'Only a passport.',
      'Only a W-2 form.',
      'W-2 form, 1099 form, income, and deduction information.'
    ],
    correctAnswer: 'W-2 form, 1099 form, income, and deduction information.',
  ),
  Question(
    text: 'What strategies can be used for debt reduction?',
    answers: [
      'Only ignoring debts.',
      'Creating a budget and planning debt repayment.',
      'Closing all credit cards.'
    ],
    correctAnswer: 'Creating a budget and planning debt repayment.',
  ),
  Question(
    text: 'What is the rule of 72 used for in finance?',
    answers: [
      'Calculating compound interest.',
      'Assessing creditworthiness.',
      'Determining retirement age.'
    ],
    correctAnswer: 'Calculating compound interest.',
  ),
  Question(
    text: 'What does FICO stand for in relation to credit scores?',
    answers: [
      'Financial Indicators and Credit Outcomes.',
      'Financial Instrument for Credit Oversight.',
      'Fair Isaac Corporation.'
    ],
    correctAnswer: 'Fair Isaac Corporation.',
  ),
  Question(
    text: 'What is the purpose of a 401(k) retirement plan?',
    answers: [
      'Tax-free savings account.',
      'Employer-sponsored retirement savings plan.',
      'Student loan repayment program.'
    ],
    correctAnswer: 'Employer-sponsored retirement savings plan.',
  ),
];
