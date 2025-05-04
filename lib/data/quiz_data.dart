import '../models/question.dart';

Map<String, List<Question>> quizData = {
  'science': [
    Question(
      id: 'sci_1',
      questionText: 'What is the closest planet to the Sun?',
      options: ['Venus', 'Mercury', 'Earth', 'Mars'],
      correctAnswerIndex: 1,
      explanation:
          'Mercury is the closest planet to the Sun at an average distance of about 36 million miles.',
    ),
    Question(
      id: 'sci_2',
      questionText: 'What is the chemical symbol for gold?',
      options: ['Go', 'Gd', 'Au', 'Ag'],
      correctAnswerIndex: 2,
      explanation:
          'The chemical symbol for gold is Au, from the Latin word "aurum".',
    ),
    Question(
      id: 'sci_3',
      questionText: 'Which of these is NOT a fundamental force of nature?',
      options: [
        'Gravity',
        'Electromagnetic force',
        'Nuclear force',
        'Centrifugal force',
      ],
      correctAnswerIndex: 3,
      explanation:
          'Centrifugal force is not a fundamental force but rather a fictitious force that appears in rotating reference frames.',
    ),
    Question(
      id: 'sci_4',
      questionText: 'What is the hardest natural substance on Earth?',
      options: ['Granite', 'Diamond', 'Titanium', 'Platinum'],
      correctAnswerIndex: 1,
      explanation:
          'Diamond is the hardest natural substance on Earth, composed of carbon atoms arranged in a crystal structure.',
    ),
    Question(
      id: 'sci_5',
      questionText: 'Which of these animals is NOT a mammal?',
      options: ['Dolphin', 'Bat', 'Penguin', 'Elephant'],
      correctAnswerIndex: 2,
      explanation:
          'Penguins are birds, not mammals. They lay eggs and have feathers instead of fur or hair.',
    ),
    Question(
      id: 'sci_6',
      questionText: 'What is the speed of light in vacuum?',
      options: ['300,000 km/s', '150,000 km/s', '200,000 km/s', '250,000 km/s'],
      correctAnswerIndex: 0,
      explanation:
          'The speed of light in vacuum is approximately 300,000 kilometers per second (299,792,458 m/s exactly).',
    ),
    Question(
      id: 'sci_7',
      questionText: 'Which of these organs is part of the immune system?',
      options: ['Liver', 'Kidney', 'Thymus', 'Pancreas'],
      correctAnswerIndex: 2,
      explanation:
          'The thymus is a specialized primary lymphoid organ of the immune system where T cells mature.',
    ),
    Question(
      id: 'sci_8',
      questionText:
          'What is the main gas that makes up the Earth\'s atmosphere?',
      options: ['Oxygen', 'Carbon Dioxide', 'Hydrogen', 'Nitrogen'],
      correctAnswerIndex: 3,
      explanation: 'Nitrogen makes up about 78% of Earth\'s atmosphere.',
    ),
    Question(
      id: 'sci_9',
      questionText: 'Which of these is NOT a state of matter?',
      options: ['Solid', 'Liquid', 'Gas', 'Energy'],
      correctAnswerIndex: 3,
      explanation:
          'Energy is not a state of matter. The four fundamental states of matter are solid, liquid, gas, and plasma.',
    ),
    Question(
      id: 'sci_10',
      questionText: 'What is the smallest unit of life?',
      options: ['Atom', 'Cell', 'Molecule', 'Tissue'],
      correctAnswerIndex: 1,
      explanation:
          'The cell is the smallest unit of life that can replicate independently.',
    ),
  ],
  'geography': [
    Question(
      id: 'geo_1',
      questionText: 'What is the largest ocean on Earth?',
      options: [
        'Atlantic Ocean',
        'Indian Ocean',
        'Pacific Ocean',
        'Arctic Ocean',
      ],
      correctAnswerIndex: 2,
      explanation:
          'The Pacific Ocean is the largest and deepest ocean on Earth, covering more than 30% of the Earth\'s surface.',
    ),
    Question(
      id: 'geo_2',
      questionText: 'Which country has the largest population in the world?',
      options: ['India', 'China', 'United States', 'Indonesia'],
      correctAnswerIndex: 0,
      explanation:
          'As of 2025, India has the largest population in the world, surpassing China.',
    ),
    Question(
      id: 'geo_3',
      questionText: 'Which desert is the largest in the world?',
      options: [
        'Gobi Desert',
        'Kalahari Desert',
        'Sahara Desert',
        'Antarctic Desert',
      ],
      correctAnswerIndex: 3,
      explanation:
          'The Antarctic Desert is the largest desert in the world. Many people don\'t realize Antarctica is classified as a desert due to its low precipitation.',
    ),
    Question(
      id: 'geo_4',
      questionText: 'Which of these countries is NOT in Europe?',
      options: ['Portugal', 'Turkey', 'Kazakhstan', 'Croatia'],
      correctAnswerIndex: 2,
      explanation:
          'Kazakhstan is located primarily in Central Asia, though a small western portion extends into Eastern Europe.',
    ),
    Question(
      id: 'geo_5',
      questionText: 'What is the capital city of Canada?',
      options: ['Toronto', 'Montreal', 'Vancouver', 'Ottawa'],
      correctAnswerIndex: 3,
      explanation:
          'Ottawa is the capital city of Canada, located in the province of Ontario.',
    ),
    Question(
      id: 'geo_6',
      questionText:
          'Which mountain range stretches across seven countries in Europe?',
      options: ['The Pyrenees', 'The Alps', 'The Carpathians', 'The Apennines'],
      correctAnswerIndex: 1,
      explanation:
          'The Alps stretch across France, Switzerland, Italy, Monaco, Liechtenstein, Austria, Germany, and Slovenia.',
    ),
    Question(
      id: 'geo_7',
      questionText: 'Which river is the longest in the world?',
      options: [
        'Amazon River',
        'Nile River',
        'Yangtze River',
        'Mississippi River',
      ],
      correctAnswerIndex: 1,
      explanation:
          'The Nile River is generally considered the longest river in the world, flowing about 6,650 kilometers.',
    ),
    Question(
      id: 'geo_8',
      questionText: 'Which of these is NOT one of the Great Lakes?',
      options: ['Lake Erie', 'Lake Superior', 'Lake Ontario', 'Lake Champlain'],
      correctAnswerIndex: 3,
      explanation:
          'Lake Champlain is not one of the Great Lakes. The five Great Lakes are Superior, Michigan, Huron, Erie, and Ontario.',
    ),
    Question(
      id: 'geo_9',
      questionText: 'Which country is both in Europe and Asia?',
      options: ['Egypt', 'Russia', 'Turkey', 'Both B and C'],
      correctAnswerIndex: 3,
      explanation:
          'Both Russia and Turkey have territory in both Europe and Asia, making them transcontinental countries.',
    ),
    Question(
      id: 'geo_10',
      questionText: 'What is the smallest country in the world by land area?',
      options: ['Monaco', 'Vatican City', 'San Marino', 'Liechtenstein'],
      correctAnswerIndex: 1,
      explanation:
          'Vatican City is the smallest country in the world with an area of just 49 hectares (121 acres).',
    ),
  ],
  'mathematics': [
    Question(
      id: 'math_1',
      questionText: 'What is the value of π (pi) to two decimal places?',
      options: ['3.14', '3.41', '3.12', '3.24'],
      correctAnswerIndex: 0,
      explanation: 'The value of π (pi) to two decimal places is 3.14.',
    ),
    Question(
      id: 'math_2',
      questionText: 'What is the square root of 169?',
      options: ['12', '13', '14', '15'],
      correctAnswerIndex: 1,
      explanation: '13 × 13 = 169, so the square root of 169 is 13.',
    ),
    Question(
      id: 'math_3',
      questionText: 'If x + y = 10 and x - y = 4, what is the value of x?',
      options: ['5', '6', '7', '8'],
      correctAnswerIndex: 2,
      explanation: 'Adding the two equations: 2x = 14, so x = 7.',
    ),
    Question(
      id: 'math_4',
      questionText: 'What is the sum of the angles in a triangle?',
      options: ['90 degrees', '180 degrees', '270 degrees', '360 degrees'],
      correctAnswerIndex: 1,
      explanation:
          'The sum of the angles in any triangle is always 180 degrees.',
    ),
    Question(
      id: 'math_5',
      questionText: 'Which of these numbers is prime?',
      options: ['51', '57', '59', '63'],
      correctAnswerIndex: 2,
      explanation:
          '59 is a prime number because it is only divisible by 1 and itself.',
    ),
    Question(
      id: 'math_6',
      questionText: 'What is the value of 5! (5 factorial)?',
      options: ['25', '60', '120', '720'],
      correctAnswerIndex: 2,
      explanation: '5! = 5 × 4 × 3 × 2 × 1 = 120',
    ),
    Question(
      id: 'math_7',
      questionText: 'What is the area of a circle with radius 5?',
      options: ['25π', '10π', '15π', '20π'],
      correctAnswerIndex: 0,
      explanation:
          'The area of a circle is πr². For a radius of 5, the area is π × 5² = 25π.',
    ),
    Question(
      id: 'math_8',
      questionText: 'Solve for x: 2x - 7 = 15',
      options: ['8', '9', '10', '11'],
      correctAnswerIndex: 3,
      explanation: '2x - 7 = 15\n2x = 22\nx = 11',
    ),
    Question(
      id: 'math_9',
      questionText: 'What is the Pythagorean theorem?',
      options: ['a² + b² = c²', 'a + b = c', 'a × b = c', 'a³ + b³ = c³'],
      correctAnswerIndex: 0,
      explanation:
          'The Pythagorean theorem states that in a right triangle, the square of the length of the hypotenuse (c) equals the sum of the squares of the other two sides (a and b).',
    ),
    Question(
      id: 'math_10',
      questionText: 'If a = 3 and b = 4, what is the value of a² + b²?',
      options: ['7', '12', '25', '49'],
      correctAnswerIndex: 2,
      explanation: 'a² + b² = 3² + 4² = 9 + 16 = 25',
    ),
  ],
  'aptitude': [
    Question(
      id: 'apt_1',
      questionText:
          'If 3 men can do a piece of work in 6 days, how many days will 9 men take to do the same work?',
      options: ['2 days', '3 days', '4 days', '18 days'],
      correctAnswerIndex: 0,
      explanation:
          'If 3 men take 6 days, then 1 man takes 18 days. So 9 men will take 18/9 = 2 days.',
    ),
    Question(
      id: 'apt_2',
      questionText:
          'A train travels at a speed of 60 km/h. How long will it take to cover a distance of 240 km?',
      options: ['3 hours', '4 hours', '5 hours', '6 hours'],
      correctAnswerIndex: 1,
      explanation: 'Time = Distance/Speed = 240/60 = 4 hours',
    ),
    Question(
      id: 'apt_3',
      questionText: 'What comes next in the series: 2, 6, 12, 20, 30, ?',
      options: ['40', '42', '45', '50'],
      correctAnswerIndex: 1,
      explanation: 'The pattern is +4, +6, +8, +10, +12... So 30 + 12 = 42',
    ),
    Question(
      id: 'apt_4',
      questionText:
          'If the day before yesterday was Wednesday, what day will it be the day after tomorrow?',
      options: ['Monday', 'Tuesday', 'Wednesday', 'Thursday'],
      correctAnswerIndex: 0,
      explanation:
          'If the day before yesterday was Wednesday, then yesterday was Thursday, today is Friday, tomorrow is Saturday, and the day after tomorrow is Sunday.',
    ),
    Question(
      id: 'apt_5',
      questionText:
          'In a class of 50 students, 40% are girls. How many boys are there in the class?',
      options: ['20', '25', '30', '35'],
      correctAnswerIndex: 2,
      explanation:
          'If 40% of students are girls, then 60% are boys. 60% of 50 = 0.6 × 50 = 30 boys.',
    ),
    Question(
      id: 'apt_6',
      questionText: 'Find the odd one out: Lion, Tiger, Leopard, Elephant',
      options: ['Lion', 'Tiger', 'Leopard', 'Elephant'],
      correctAnswerIndex: 3,
      explanation:
          'Elephant is the odd one out because it is not a member of the cat family (Felidae) while the others are.',
    ),
    Question(
      id: 'apt_7',
      questionText:
          'If A is the brother of B, B is the sister of C, and C is the father of D, how is D related to A?',
      options: [
        'Nephew',
        'Niece',
        'Either nephew or niece',
        'Data insufficient',
      ],
      correctAnswerIndex: 2,
      explanation:
          'A is the brother of B, who is the sister of C. So A is C\'s brother. C is D\'s father, making D either A\'s nephew or niece, depending on D\'s gender which is not specified.',
    ),
    Question(
      id: 'apt_8',
      questionText:
          'What is the next number in the sequence: 1, 4, 9, 16, 25, ?',
      options: ['30', '36', '40', '49'],
      correctAnswerIndex: 1,
      explanation:
          'These are square numbers. 1=1², 4=2², 9=3², 16=4², 25=5², so the next is 6² = 36.',
    ),
    Question(
      id: 'apt_9',
      questionText:
          'If 5 workers can build a wall in 8 days, how many workers are needed to build the same wall in 2 days?',
      options: ['10', '15', '20', '25'],
      correctAnswerIndex: 2,
      explanation:
          'Using the formula (W₁ × D₁) = (W₂ × D₂), we get (5 × 8) = (W₂ × 2), so W₂ = 20.',
    ),
    Question(
      id: 'apt_10',
      questionText:
          'A pizza is cut into 8 equal slices. If you eat 3 slices, what fraction of the pizza remains?',
      options: ['3/8', '5/8', '5/3', '3/5'],
      correctAnswerIndex: 1,
      explanation:
          'If you eat 3 out of 8 slices, then 8 - 3 = 5 slices remain, which is 5/8 of the pizza.',
    ),
  ],
  'chemistry': [
    Question(
      id: 'chem_1',
      questionText: 'What is the chemical formula for water?',
      options: ['H₂O', 'CO₂', 'NaCl', 'H₂SO₄'],
      correctAnswerIndex: 0,
      explanation:
          'Water consists of two hydrogen atoms and one oxygen atom, giving it the chemical formula H₂O.',
    ),
    Question(
      id: 'chem_2',
      questionText: 'Which element has the chemical symbol Fe?',
      options: ['Fluorine', 'Francium', 'Fermium', 'Iron'],
      correctAnswerIndex: 3,
      explanation:
          'Fe is the chemical symbol for Iron, which comes from its Latin name "ferrum".',
    ),
    Question(
      id: 'chem_3',
      questionText: 'What is the pH of a neutral solution?',
      options: ['0', '7', '10', '14'],
      correctAnswerIndex: 1,
      explanation:
          'On the pH scale, 7 represents a neutral solution, below 7 is acidic, and above 7 is basic/alkaline.',
    ),
    Question(
      id: 'chem_4',
      questionText: 'Which gas makes up the majority of Earth\'s atmosphere?',
      options: ['Oxygen', 'Carbon Dioxide', 'Nitrogen', 'Hydrogen'],
      correctAnswerIndex: 2,
      explanation:
          'Nitrogen makes up about 78% of Earth\'s atmosphere, while oxygen makes up about 21%.',
    ),
    Question(
      id: 'chem_5',
      questionText: 'What is the atomic number of carbon?',
      options: ['4', '6', '12', '14'],
      correctAnswerIndex: 1,
      explanation:
          'Carbon has 6 protons in its nucleus, giving it an atomic number of 6.',
    ),
    Question(
      id: 'chem_6',
      questionText: 'Which of these is NOT a noble gas?',
      options: ['Neon', 'Argon', 'Nitrogen', 'Xenon'],
      correctAnswerIndex: 2,
      explanation:
          'Nitrogen is not a noble gas. Noble gases include helium, neon, argon, krypton, xenon, and radon.',
    ),
    Question(
      id: 'chem_7',
      questionText:
          'What type of chemical bond involves the sharing of electron pairs?',
      options: [
        'Ionic bond',
        'Covalent bond',
        'Hydrogen bond',
        'Metallic bond',
      ],
      correctAnswerIndex: 1,
      explanation:
          'A covalent bond involves the sharing of electron pairs between atoms.',
    ),
    Question(
      id: 'chem_8',
      questionText: 'What is the most abundant element in the universe?',
      options: ['Oxygen', 'Carbon', 'Hydrogen', 'Helium'],
      correctAnswerIndex: 2,
      explanation:
          'Hydrogen is the most abundant element in the universe, accounting for about 75% of all matter.',
    ),
    Question(
      id: 'chem_9',
      questionText: 'Which of these is an alkali metal?',
      options: ['Lithium', 'Aluminum', 'Zinc', 'Calcium'],
      correctAnswerIndex: 0,
      explanation:
          'Lithium is an alkali metal, located in Group 1 of the periodic table.',
    ),
    Question(
      id: 'chem_10',
      questionText: 'What happens during oxidation?',
      options: [
        'Gain of electrons',
        'Loss of electrons',
        'Gain of protons',
        'Loss of protons',
      ],
      correctAnswerIndex: 1,
      explanation:
          'Oxidation involves the loss of electrons, while reduction involves the gain of electrons.',
    ),
  ],
};
