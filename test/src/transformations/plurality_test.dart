// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:humanizer/src/transformations/plurality.dart';
import 'package:test/test.dart';

void main() {
  _toSingular();
  _toPlural();
  _both();
}

void _toSingular() {
  group('to singular', () {
    void verify({
      required String input,
      required String expected,
      required bool inputMayAlreadyHaveTargetPlurality,
    }) {
      final transformation = PluralityTransformation(
        targetPlurality: Plurality.singular,
        inputMayAlreadyHaveTargetPlurality: inputMayAlreadyHaveTargetPlurality,
      );
      final result = transformation.transform(input, '');
      expect(result, expected);
    }

    test('can singularize when plurality is unknown', () {
      _singularToPluralMap.forEach((singular, plural) {
        verify(
          input: plural,
          expected: singular,
          inputMayAlreadyHaveTargetPlurality: true,
        );
        verify(
          input: singular,
          expected: singular,
          inputMayAlreadyHaveTargetPlurality: true,
        );
      });
    });

    test('can singularize when plurality is known', () {
      _singularToPluralMap.forEach((singular, plural) => verify(
            input: plural,
            expected: singular,
            inputMayAlreadyHaveTargetPlurality: false,
          ));
    });
  });
}

void _toPlural() {
  group('to plural', () {
    void verify({
      required String input,
      required String expected,
      required bool inputMayAlreadyHaveTargetPlurality,
    }) {
      final transformation = PluralityTransformation(
        targetPlurality: Plurality.plural,
        inputMayAlreadyHaveTargetPlurality: inputMayAlreadyHaveTargetPlurality,
      );
      final result = transformation.transform(input, '');
      expect(result, expected);
    }

    test('can pluralize when plurality is unknown', () {
      _singularToPluralMap.forEach((singular, plural) {
        verify(
          input: singular,
          expected: plural,
          inputMayAlreadyHaveTargetPlurality: true,
        );
        verify(
          input: plural,
          expected: plural,
          inputMayAlreadyHaveTargetPlurality: true,
        );
      });
    });

    test('can pluralize when plurality is known', () {
      _singularToPluralMap.forEach((singular, plural) => verify(
            input: singular,
            expected: plural,
            inputMayAlreadyHaveTargetPlurality: false,
          ));
    });
  });
}

void _both() {
  group('both', () {
    void verify({
      required String input,
      required Plurality targetPlurality,
      required String expected,
      required bool inputMayAlreadyHaveTargetPlurality,
    }) {
      final transformation = PluralityTransformation(
        targetPlurality: targetPlurality,
        inputMayAlreadyHaveTargetPlurality: inputMayAlreadyHaveTargetPlurality,
      );
      final result = transformation.transform(input, '');
      expect(result, expected);
    }

    final whitespaceVariants = [
      ' ',
      '    ',
      '\t',
      ' \t  ',
    ];

    test('leading whitespace is left intact', () {
      whitespaceVariants.forEach((whitespaceVariant) =>
          _singularToPluralMap.forEach((singular, plural) {
            verify(
              input: '$whitespaceVariant$plural',
              targetPlurality: Plurality.singular,
              expected: '$whitespaceVariant$singular',
              inputMayAlreadyHaveTargetPlurality: false,
            );
            verify(
              input: '$whitespaceVariant$singular',
              targetPlurality: Plurality.plural,
              expected: '$whitespaceVariant$plural',
              inputMayAlreadyHaveTargetPlurality: false,
            );
          }));
    });

    test('trailing whitespace is left intact', () {
      whitespaceVariants.forEach((whitespaceVariant) =>
          _singularToPluralMap.forEach((singular, plural) {
            verify(
              input: '$plural$whitespaceVariant',
              targetPlurality: Plurality.singular,
              expected: '$singular$whitespaceVariant',
              inputMayAlreadyHaveTargetPlurality: false,
            );
            verify(
              input: '$singular$whitespaceVariant',
              targetPlurality: Plurality.plural,
              expected: '$plural$whitespaceVariant',
              inputMayAlreadyHaveTargetPlurality: false,
            );
          }));
    });

    test('multiple words are treated as one', () {
      verify(
        input: 'ship fox ox',
        targetPlurality: Plurality.singular,
        expected: 'ship fox ox',
        inputMayAlreadyHaveTargetPlurality: false,
      );
      verify(
        input: 'ship fox ox',
        targetPlurality: Plurality.plural,
        expected: 'ship fox oxen',
        inputMayAlreadyHaveTargetPlurality: false,
      );
    });
  });
}

final _singularToPluralMap = <String, String>{
  '': '',
  ' ': ' ',
  'ability': 'abilities',
  'addendum': 'addenda',
  'address': 'addresses',
  'adulthood': 'adulthood',
  'advice': 'advice',
  'agency': 'agencies',
  'agenda': 'agenda',
  'aid': 'aid',
  'aircraft': 'aircraft',
  'alcohol': 'alcohol',
  'alga': 'algae',
  'alias': 'aliases',
  'alumna': 'alumnae',
  'alumnus': 'alumni',
  'ammo': 'ammo',
  'analysis': 'analyses',
  'analytics': 'analytics',
  'anime': 'anime',
  'apparatus': 'apparatuses',
  'appendix': 'appendices',
  'archive': 'archives',
  'athletics': 'athletics',
  'audio': 'audio',
  'axis': 'axes',
  'bacterium': 'bacteria',
  'basis': 'bases',
  'bias': 'biases',
  'bison': 'bison',
  'blitz': 'blitzes',
  'blood': 'blood',
  'bookie': 'bookies',
  'box': 'boxes',
  'bream': 'bream',
  'buffalo': 'buffaloes',
  'bus': 'buses',
  'butter': 'butter',
  'buzz': 'buzzes',
  'cache': 'caches',
  'cactus': 'cacti',
  'cafe': 'cafes',
  'campus': 'campuses',
  'carp': 'carp',
  'case': 'cases',
  'cash': 'cash',
  'category': 'categories',
  'chairman': 'chairmen',
  'chassis': 'chassis',
  'chess': 'chess',
  'child': 'children',
  'clothing': 'clothing',
  'cod': 'cod',
  'comment': 'comments',
  'commerce': 'commerce',
  'cookie': 'cookies',
  'cooperation': 'cooperation',
  'corn': 'corn',
  'corps': 'corps',
  'crisis': 'crises',
  'criterion': 'criteria',
  'curriculum': 'curricula',
  'database': 'databases',
  'datum': 'data',
  'day': 'days',
  'debris': 'debris',
  'deer': 'deer',
  'diabetes': 'diabetes',
  'diagnosis': 'diagnoses',
  'die': 'dice',
  'digestion': 'digestion',
  'dwarf': 'dwarves',
  'echo': 'echoes',
  'edge': 'edges',
  'elf': 'elves',
  'elk': 'elk',
  'ellipsis': 'ellipses',
  'embargo': 'embargoes',
  'emphasis': 'emphases',
  'energy': 'energy',
  'equipment': 'equipment',
  'ex': 'exes',
  'excretion': 'excretion',
  'experience': 'experiences',
  'expertise': 'expertise',
  'firmware': 'firmware',
  'fish': 'fish',
  'fix': 'fixes',
  'flounder': 'flounder',
  'focus': 'foci',
  'foobar': 'foobars',
  'foot': 'feet',
  'freshman': 'freshmen',
  'fun': 'fun',
  'fungus': 'fungi',
  'fuse': 'fuses',
  'gallows': 'gallows',
  'garbage': 'garbage',
  'glove': 'gloves',
  'goose': 'geese',
  'graffiti': 'graffiti',
  'grass': 'grass',
  'hair': 'hair',
  'half': 'halves',
  'hardware': 'hardware',
  'he': 'they',
  'headquarters': 'headquarters',
  'health': 'health',
  'hero': 'heroes',
  'herpes': 'herpes',
  'highjinks': 'highjinks',
  'herself': 'themselves',
  'hippopotamus': 'hippopotamuses',
  'homework': 'homework',
  'hoof': 'hooves',
  'horse': 'horses',
  'house': 'houses',
  'housework': 'housework',
  'human': 'humans',
  'i': 'we',
  'index': 'indices',
  'information': 'information',
  'iris': 'irises',
  'is': 'are',
  'jeans': 'jeans',
  'justice': 'justice',
  'kudos': 'kudos',
  'labour': 'labour',
  'larva': 'larvae',
  'leaf': 'leaves',
  'literature': 'literature',
  'loaf': 'loaves',
  'louse': 'lice',
  'luggage': 'luggage',
  'machinery': 'machinery',
  'mackerel': 'mackerel',
  'mail': 'mail',
  'man': 'men',
  'manga': 'manga',
  'matrix': 'matrices',
  'me': 'us',
  'means': 'means',
  'medium': 'media',
  'mews': 'mews',
  'milk': 'milk',
  'millennium': 'millennia',
  'moose': 'moose',
  'mosquito': 'mosquitoes',
  'mouse': 'mice',
  'move': 'moves',
  'movie': 'movies',
  'mud': 'mud',
  'music': 'music',
  'myself': 'ourselves',
  'neurosis': 'neuroses',
  'news': 'news',
  'newsletter': 'newsletters',
  'node_child': 'node_children',
  'nucleus': 'nuclei',
  'oasis': 'oases',
  'octopus': 'octopuses',
  'offspring': 'offspring',
  'only': 'only',
  'ox': 'oxen',
  'paralysis': 'paralyses',
  'person': 'people',
  'personnel': 'personnel',
  'perspective': 'perspectives',
  'phenomenon': 'phenomena',
  'photo': 'photos',
  'pike': 'pike',
  'plankton': 'plankton',
  'pliers': 'pliers',
  'police': 'police',
  'pollution': 'pollution',
  'portfolio': 'portfolios',
  'potato': 'potatoes',
  'premises': 'premises',
  'prize': 'prizes',
  'process': 'processes',
  'query': 'queries',
  'quiz': 'quizzes',
  'radius': 'radii',
  'rain': 'rain',
  'research': 'research',
  'rice': 'rice',
  'rookie': 'rookies',
  'roomie': 'roomies',
  'safe': 'safes',
  'salesperson': 'salespeople',
  'salmon': 'salmon',
  'save': 'saves',
  'scissors': 'scissors',
  'search': 'searches',
  'semen': 'semen',
  'seraph': 'seraphim',
  'series': 'series',
  'sewage': 'sewage',
  'shambles': 'shambles',
  'sheep': 'sheep',
  'shoe': 'shoes',
  'shrimp': 'shrimp',
  'smoothie': 'smoothies',
  'software': 'software',
  'someone': 'someone',
  'species': 'species',
  'sperm': 'sperm',
  'spokesman': 'spokesmen',
  'stack': 'stacks',
  'staff': 'staff',
  'status_code': 'status_codes',
  'status': 'statuses',
  'stimulus': 'stimuli',
  'swine': 'swine',
  'switch': 'switches',
  'syllabus': 'syllabi',
  'tennis': 'tennis',
  'testis': 'testes',
  'that': 'those',
  'thief': 'thieves',
  'this': 'these',
  'tomato': 'tomatoes',
  'tooth': 'teeth',
  'torpedo': 'torpedoes',
  'traffic': 'traffic',
  'training': 'training',
  'transportation': 'transportation',
  'trellis': 'trellises',
  'trout': 'trout',
  'tuna': 'tuna',
  'vertebra': 'vertebrae',
  'vertex': 'vertices',
  'veto': 'vetoes',
  'virus': 'viruses',
  'volcano': 'volcanoes',
  'walrus': 'walruses',
  'waltz': 'waltzes',
  'water': 'water',
  'waters': 'waters',
  'wave': 'waves',
  'wealth': 'wealth',
  'welfare': 'welfare',
  'which': 'which',
  'whiting': 'whiting',
  'who': 'who',
  'wife': 'wives',
  'wildebeest': 'wildebeest',
  'wildlife': 'wildlife',
  'wish': 'wishes',
  'wolf': 'wolves',
  'woman': 'women',
  'you': 'you',
  'yourself': 'yourselves',
  'zombie': 'zombies',
};
