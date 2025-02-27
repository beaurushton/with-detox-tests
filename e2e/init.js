import { cleanup, init } from 'detox';

const adapter = require('detox/runners/jest/adapter');
const specReporter = require('detox/runners/jest/specReporter');

const config = require('../package.json').detox;

jest.setTimeout(60000);
jasmine.getEnv().addReporter(adapter);

// This takes care of generating status logs on a per-spec basis. By default, jest only reports at file-level.
// This is strictly optional.
jasmine.getEnv().addReporter(specReporter);

beforeAll(async () => {
  await init(config);
});

beforeEach(async () => {
  await adapter.beforeEach();
});

afterAll(async () => {
  await adapter.afterAll();
  await cleanup();
});