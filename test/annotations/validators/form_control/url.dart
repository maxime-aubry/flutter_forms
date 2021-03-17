import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import '../../../form/reactive_form/parts/initializer/initializer.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > Url.', () {
    group('Valid.', () {
      test('url is null.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: null, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, isNull);
      });

      test('http://foo.com/blah_blah is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://foo.com/blah_blah',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://foo.com/blah_blah');
      });

      test('http://foo.com/blah_blah/ is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://foo.com/blah_blah/',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://foo.com/blah_blah/');
      });

      test('http://foo.com/blah_blah_(wikipedia) is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://foo.com/blah_blah_(wikipedia)',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://foo.com/blah_blah_(wikipedia)');
      });

      test('http://foo.com/blah_blah_(wikipedia)_(again) is a valid url.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://foo.com/blah_blah_(wikipedia)_(again)',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(
          formControl.value,
          'http://foo.com/blah_blah_(wikipedia)_(again)',
        );
      });

      test('http://www.example.com/wpstyle/?p=364 is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://www.example.com/wpstyle/?p=364',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://www.example.com/wpstyle/?p=364');
      });

      test('https://www.example.com/foo/?bar=baz&inga=42&quux is a valid url.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'https://www.example.com/foo/?bar=baz&inga=42&quux',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(
          formControl.value,
          'https://www.example.com/foo/?bar=baz&inga=42&quux',
        );
      });

      test('http://✪df.ws/123 is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://✪df.ws/123',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://✪df.ws/123');
      });

      test('http://userid:password@example.com:8080 is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://userid:password@example.com:8080',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://userid:password@example.com:8080');
      });

      test('http://userid:password@example.com:8080/ is a valid url.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://userid:password@example.com:8080/',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(
          formControl.value,
          'http://userid:password@example.com:8080/',
        );
      });

      test('http://userid@example.com is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://userid@example.com',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://userid@example.com');
      });

      test('http://userid@example.com/ is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://userid@example.com/',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://userid@example.com/');
      });

      test('http://userid@example.com:8080 is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://userid@example.com:8080',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://userid@example.com:8080');
      });

      test('http://userid@example.com:8080/ is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://userid@example.com:8080/',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://userid@example.com:8080/');
      });

      test('http://userid:password@example.com is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://userid:password@example.com',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://userid:password@example.com');
      });

      test('http://userid:password@example.com/ is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://userid:password@example.com/',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://userid:password@example.com/');
      });

      test('http://142.42.1.1/ is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://142.42.1.1/',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://142.42.1.1/');
      });

      test('http://142.42.1.1:8080/ is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://142.42.1.1:8080/',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://142.42.1.1:8080/');
      });

      test('http://➡.ws/䨹 is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://➡.ws/䨹',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://➡.ws/䨹');
      });

      test('http://⌘.ws is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://⌘.ws',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://⌘.ws');
      });

      test('http://⌘.ws/ is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://⌘.ws/',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://⌘.ws/');
      });

      test('http://foo.com/blah_(wikipedia)#cite-1 is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://foo.com/blah_(wikipedia)#cite-1',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://foo.com/blah_(wikipedia)#cite-1');
      });

      test('http://foo.com/blah_(wikipedia)_blah#cite-1 is a valid url.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://foo.com/blah_(wikipedia)_blah#cite-1',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(
          formControl.value,
          'http://foo.com/blah_(wikipedia)_blah#cite-1',
        );
      });

      test('http://foo.com/unicode_(✪)_in_parens is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://foo.com/unicode_(✪)_in_parens',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://foo.com/unicode_(✪)_in_parens');
      });

      test('http://foo.com/(something)?after=parens is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://foo.com/(something)?after=parens',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://foo.com/(something)?after=parens');
      });

      test('http://☺.damowmow.com/ is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://☺.damowmow.com/',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://☺.damowmow.com/');
      });

      test('http://code.google.com/events/#&product=browser is a valid url.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://code.google.com/events/#&product=browser',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(
          formControl.value,
          'http://code.google.com/events/#&product=browser',
        );
      });

      test('http://j.mp is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://j.mp',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://j.mp');
      });

      test('ftp://foo.bar/baz is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'ftp://foo.bar/baz',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'ftp://foo.bar/baz');
      });

      test('http://foo.bar/?q=Test%20URL-encoded%20stuff is a valid url.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://foo.bar/?q=Test%20URL-encoded%20stuff',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(
          formControl.value,
          'http://foo.bar/?q=Test%20URL-encoded%20stuff',
        );
      });

      test('http://مثال.إختبار is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://مثال.إختبار',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://مثال.إختبار');
      });

      test('http://例子.测试 is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://例子.测试',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://例子.测试');
      });

      test('http://उदाहरण.परीक्षा is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://उदाहरण.परीक्षा',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://उदाहरण.परीक्षा');
      });

      test(
          r"http://-.~_!$&'()*+,;=:%40:80%2f::::::@example.com is a valid url.",
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r"http://-.~_!$&'()*+,;=:%40:80%2f::::::@example.com",
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(
          formControl.value,
          r"http://-.~_!$&'()*+,;=:%40:80%2f::::::@example.com",
        );
      });

      test('http://1337.net is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://1337.net',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://1337.net');
      });

      test('http://a.b-c.de is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://a.b-c.de',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://a.b-c.de');
      });

      test('http://223.255.255.254 is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://223.255.255.254',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://223.255.255.254');
      });

      test('http://a.b--c.de/ is a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://a.b--c.de/',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'http://a.b--c.de/');
      });
    });

    group('Invalid.', () {
      test('http:// is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: 'http://', validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http://');
      });

      test('http://. is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: 'http://.', validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http://.');
      });

      test('http://.. is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child':
                new FormControl<String>(value: 'http://..', validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http://..');
      });

      test('http://../ is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child':
                new FormControl<String>(value: 'http://../', validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http://../');
      });

      test('http://? is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: 'http://?', validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http://?');
      });

      test('http://?? is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://??',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http://??');
      });

      test('http://??/ is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://??/',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http://??/');
      });

      test('http://# is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://#',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http://#');
      });

      test('http://## is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://##',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http://##');
      });

      test('http://##/ is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://##/',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http://##/');
      });

      test('http://foo.bar?q=Spaces should be encoded is not a valid url.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://foo.bar?q=Spaces should be encoded',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http://foo.bar?q=Spaces should be encoded');
      });

      test('// is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: '//', validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, '//');
      });

      test('//a is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: '//a', validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, '//a');
      });

      test('///a is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: '///a', validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, '///a');
      });

      test('/// is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: '///', validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, '///');
      });

      test('http:///a is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http:///a',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http:///a');
      });

      test('foo.com is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: 'foo.com', validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'foo.com');
      });

      test('rdar://1234 is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'rdar://1234',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'rdar://1234');
      });

      test('h://test is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: 'h://test', validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'h://test');
      });

      test('http:// shouldfail.com is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http:// shouldfail.com',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http:// shouldfail.com');
      });

      test(':// should fail is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: '://', validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, '://');
      });

      test('http://foo.bar/foo(bar)baz quux is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://foo.bar/foo(bar)baz quux',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http://foo.bar/foo(bar)baz quux');
      });

      test('ftps://foo.bar/ is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'ftps://foo.bar/',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'ftps://foo.bar/');
      });

      test('http://-error-.invalid/ is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://-error-.invalid/',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http://-error-.invalid/');
      });

      test('http://-a.b.co is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://-a.b.co',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http://-a.b.co');
      });

      test('http://a.b-.co is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://a.b-.co',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http://a.b-.co');
      });

      test('http://0.0.0.0 is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://0.0.0.0',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http://0.0.0.0');
      });

      test('http://10.1.1.0 is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://10.1.1.0',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http://10.1.1.0');
      });

      test('http://10.1.1.255 is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://10.1.1.255',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http://10.1.1.255');
      });

      test('http://224.1.1.1 is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://224.1.1.1',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http://224.1.1.1');
      });

      test('http://1.1.1.1.1 is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://1.1.1.1.1',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http://1.1.1.1.1');
      });

      test('http://123.123.123 is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://123.123.123',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http://123.123.123');
      });

      test('http://3628126748 is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://3628126748',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http://3628126748');
      });

      test('http://.www.foo.bar/ is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://.www.foo.bar/',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http://.www.foo.bar/');
      });

      /*test('http://www.foo.bar./ is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://www.foo.bar./',
              validators: [],
            ),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http://www.foo.bar./');
      });*/

      test('http://.www.foo.bar./ is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://.www.foo.bar./',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http://.www.foo.bar./');
      });

      test('http://10.1.1.1 is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://10.1.1.1',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http://10.1.1.1');
      });

      test('http://10.1.1.254 is not a valid url.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://10.1.1.254',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(
          protocols: [EUrlProtocol.http, EUrlProtocol.https, EUrlProtocol.ftp],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'http://10.1.1.254');
      });
    });

    group('Exceptions', () {
      test(
          'Throws an exception of ValidatorParameterException type when protocols is null.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://www.google.fr',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(protocols: null, error: null);

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'protocols is not defined.');
      });

      test(
          'Throws an exception of ValidatorParameterException type when protocols is empty.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'http://www.google.fr',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        Url validator = Url(protocols: [], error: null);

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'protocols is not defined.');
      });
    });
  });
}
