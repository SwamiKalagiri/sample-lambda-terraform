const sut = require('../src/index');
const Chance = require('chance');

const chance = new Chance();

describe('Index Test Suite', () => {
  it('should return response', () => {
    const name = chance.string();
    const event = {
      name,
    };
    const context = {};
    const expectedResponse = `Hello ${event.name}!, Welcome lambda world.`;
    const callback = (error, response) => {
      expect(response).toEqual(expectedResponse);
    };

    sut.get(event, context, callback);
  });
});
