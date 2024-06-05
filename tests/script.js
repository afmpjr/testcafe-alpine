import { Selector } from 'testcafe';

const pageURL = 'https://www.google.com';

fixture`Google Test`
    .page(pageURL);

test('is Google available?', async t => {
    await t.expect(Selector('body').textContent).contains('Google');
});
